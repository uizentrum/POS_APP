import 'package:flutter/material.dart' hide Image;
import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_state.dart';
import 'dart:io' show Platform;
import 'package:tarka/model/cart_model.dart';
import 'package:tarka/model/product_model.dart';
import 'package:tarka/widget/custom_appbar.dart';
import 'package:tarka/widget/custom_navbar.dart';

class Print extends StatefulWidget {
  static const String? routeName = "/print";

  final state;

  const Print({
    Key? key,
    required this.state,
  }) : super(key: key);

  // static Route route({}) {
  //   return MaterialPageRoute(
  //     settings: RouteSettings(name: routeName),
  //     builder: (_) => Print(

  //     ),
  //   );
  // }

  @override
  _PrintState createState() => _PrintState(
        state,
      );
}

class _PrintState extends State<Print> {
  PrinterBluetoothManager _printerManager = PrinterBluetoothManager();
  List<PrinterBluetooth> _devices = [];
  String? _devicesMsg;
  BluetoothManager bluetoothManager = BluetoothManager.instance;
  final state;

  _PrintState(
    this.state,
  );

  @override
  void initState() {
    print(state);
    if (Platform.isAndroid) {
      bluetoothManager.state.listen((
        val,
      ) {
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
      backgroundColor: Colors.blueGrey.shade800,
      appBar: AppBar(
        title: Text(
          "Print",
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
        elevation: 8,
        shadowColor: Colors.black,
        backgroundColor: Colors.blueGrey,
      ),
      body: _devices.isEmpty
          ? Center(child: Text(_devicesMsg ?? ""))
          : ListView.builder(
              itemCount: _devices.length,
              itemBuilder: (c, i) {
                return ListTile(
                  leading: Icon(Icons.print),
                  title: Text(_devices[i].name ?? ""),
                  subtitle: Text(_devices[i].address!),
                  onTap: () {
                    _startPrint(_devices[i]);
                  },
                );
              },
            ),
      bottomNavigationBar: CustomNavBar(screen: "/print"),
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
    final result =
        await _printerManager.printTicket(await _ticket(PaperSize.mm80));
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(result.msg),
      ),
    );
  }

  Future<Ticket> _ticket(PaperSize paper) async {
    final ticket = Ticket(paper);

    ticket.text(
      'POS Purchase',
      styles: PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2),
      linesAfter: 1,
    );
    ticket.row([
      PosColumn(
          text: 'Bestellnummer: ', width: 12, styles: PosStyles(bold: true)),
    ]);

    ticket.row([
      PosColumn(
          text: '-------------------------------',
          width: 12,
          styles: PosStyles(bold: true)),
    ]);

    for (var i = 0; i < widget.state.length; i++) {
      ticket.text(widget.state[i].name);
      ticket.row([
        PosColumn(text: '\$${widget.state[i].price.toString()}', width: 6),
        // PosColumn(text: '\$${widget.state[i].price.toString()}', width: 6),
      ]);
    }

    ticket.feed(1);

    ticket.row([
      PosColumn(text: 'Total: \$', width: 6, styles: PosStyles(bold: true)),
      PosColumn(
          text: "${state.cart.totolString}",
          width: 6,
          styles: PosStyles(bold: true)),
    ]);

    ticket.row([
      PosColumn(
          text: '-------------------------------',
          width: 12,
          styles: PosStyles(bold: true)),
    ]);
    ticket.text(
      'Berzahlung:',
      styles: PosStyles(
          align: PosAlign.left,
          height: PosTextSize.size2,
          width: PosTextSize.size1),
      linesAfter: 0,
    );

    ticket.feed(1);

    ticket.text('POS purchase',
        styles: PosStyles(align: PosAlign.left, bold: true));
    ticket.feed(1);
    ticket.text('Bergmannstrasse 27,',
        styles: PosStyles(align: PosAlign.left, bold: true));
    ticket.text('10961 Berlin, Germany',
        styles: PosStyles(align: PosAlign.left, bold: true));
    ticket.feed(1);
    ticket.text('Steuernummer: 34/535/00093',
        styles: PosStyles(align: PosAlign.left, bold: true));

    ticket.feed(1);
    ticket.row([
      PosColumn(
        text: 'Vielen Dank Fur Ihren Einkauf',
        width: 12,
        styles: PosStyles(align: PosAlign.left, bold: true),
      )
    ]);
    ticket.row([
      PosColumn(
        text: 'Umtausch nur mit Kassenbon',
        width: 12,
        styles: PosStyles(align: PosAlign.left, bold: true),
      )
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
