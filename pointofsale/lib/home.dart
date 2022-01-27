import 'package:flutter/material.dart';
import 'package:pointofsale/print.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List data = [];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    int _total = 0;

    for (int i = 0; i < data.length; i++) {
      _total = data[i]['price'];
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(data[i]['ProductName']),
                  subtitle: Text(
                      'Rp ${data[i]['initialPrice']} x ${data[i]['quantity']}'),
                  trailing: Text('Rp ${data[i]['ProductPrice']}'),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Total :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rp $_total :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text('Print'),
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => Print("")));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class cartList {}
