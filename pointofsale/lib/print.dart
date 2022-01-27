
import 'package:flutter/material.dart' hide Image;
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'dart:io' show Platform;


class Print extends StatefulWidget {
final List<Map<String, dynamic>> data;
   Print(this.data);
  @override
  _PrintState createState() => _PrintState();
}

class _PrintState extends State<Print> {

  PrinterBluetoothManager _printerManager = PrinterBluetoothManager();
  List<PrinterBluetooth> _devices = [];
  String? _devicesMsg;
  BluetoothManager bluetoothManager = BluetoothManager.instance;

  @override
  void initState() {
    if (Platform.isAndroid) {
      bluetoothManager.state.listen((val) {
        print('state = $val');
        if (!mounted) return;
        if (val == 12) {
          print('on');
          initPrinter();
        } else if (val == 10) {
          print('off');
          setState(() => _devicesMsg = 'Bluetooth Disconnect!');
        }
      });
    } else {
      initPrinter();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print'),
      ),
      body: _devices.isEmpty
          ? Center(child: Text(_devicesMsg ?? ''))
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (c, i) {
                return ListTile(
                  leading: Icon(Icons.print),
                  title: Text(_devices[i].name),
                  subtitle: Text(_devices[i].address),
                  onTap: () {
                    _startPrint(_devices[i]);
                  },
                );
              },
            ),
    );
  }

  void initPrinter() {
    _printerManager.startScan(Duration(seconds: 2));
    _printerManager.scanResults.listen((val) {
      if (!mounted) return;
      setState(() => _devices = val);
      if (_devices.isEmpty) setState(() => _devicesMsg = 'No Devices');
    });
  }

  Future<void> _startPrint(PrinterBluetooth printer) async {
    _printerManager.selectPrinter(printer);
    final result = await _printerManager.printTicket(await _ticket(PaperSize.mm58));
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(result.msg),
      ),
    );
  }

  Future<Ticket> _ticket(PaperSize paper) async {
    final ticket = Ticket(paper);
     double _totalPrice=0;

    // // Image assets
    // final ByteData data = await rootBundle.load('assets/store.png');
    // final Uint8List bytes = data.buffer.asUint8List();
    // final Image image = decodeImage(bytes);
    // ticket.image(image);
     ticket.text(
      "POS purchase",
      styles: PosStyles(align: PosAlign.left,height: PosTextSize.size1,width: PosTextSize.size1),
      linesAfter: 0,
    );

    ticket.row([

      PosColumn(text:'Bezahlung: ', width: 12, styles: PosStyles(bold:  true)),
    ]);

    ticket.text(
      'Barzahlung',
      styles: PosStyles(align: PosAlign.left,height: PosTextSize.size2,width: PosTextSize.size2),
      linesAfter: 1,
    );

     ticket.row([
      PosColumn(text: 'Bestellnummer: ', width: 12, styles: PosStyles(bold:  true)),

    ]);
    ticket.row([
      PosColumn(text: '${widget.data}', width: 12, styles: PosStyles(bold:  true)),
    ]);

    ticket.row([
      PosColumn(text: 'Auftragsdatum: ', width: 12, styles: PosStyles(bold:  true)),

    ]);
    ticket.row([

  PosColumn(text: '${widget.data}', width: 12, styles: PosStyles(bold:  true)),
    ]);

    ticket.row([
      PosColumn(text: '-------------------------------', width: 12, styles: PosStyles(bold:  true)),


    ]);

    for (var i = 0; i < widget.data.length; i++) {
      _totalPrice += widget.data[i]['productPrice'];
      ticket.text(widget.data[i]['productName']);
      ticket.row([
        PosColumn(
            text: '${widget.data[i]['initialPrice']} x ${widget.data[i]['quantity']}',
            width: 6),
        PosColumn(text: '\$ ${widget.data[i]['productPrice']}', width: 6),
      ]);
    }
    
    ticket.feed(1);
    ticket.row([
      PosColumn(text: 'Total', width: 6, styles: PosStyles(bold: true)),
      PosColumn(text: '\$ $_totalPrice', width: 6, styles: PosStyles(bold: true)),
    ]);
    ticket.row([
      PosColumn(text: '-------------------------------', width: 12, styles: PosStyles(bold:  true)),


    ]);

    ticket.feed(1);
    ticket.text('POS Purchase',styles: PosStyles(align: PosAlign.left, bold:  true));
    ticket.text('Turmstraße 17,',styles: PosStyles(align: PosAlign.left, bold:  true));
    ticket.text('10559 Berlin, Germany',styles: PosStyles(align: PosAlign.left, bold:  true));
    ticket.text('Tel: (0) 3039834017',styles: PosStyles(align: PosAlign.left, bold:  true));
    ticket.feed(1);

    ticket.row([
      PosColumn(text: 'Vielen Dank Fur Ihren Einkauf', width: 12, styles: PosStyles(align: PosAlign.left, bold:  true),)
    ]);
    ticket.row([
      PosColumn(text: 'Umtausch nur mit Kassenbon', width: 12, styles: PosStyles(align: PosAlign.left, bold:  true),)
    ]);

    ticket.cut();

    return ticket;
  }

  @override
  void dispose() {
    _printerManager.stopScan();
    super.dispose();
  }

}