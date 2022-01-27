// import 'package:flutter/material.dart';
// import 'package:tarka/model/product_model.dart';
// import 'package:tarka/screens/print/print.dart';

// class Home extends StatelessWidget {
  
//   Home({Key? key,}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     for (var i = 0; i < Product.products.length; i++) {}

//     return Scaffold(
//       backgroundColor: Colors.teal.shade50,
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text('Print Bill'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             GetX<ShoppingController>(builder: (controller) {
//               return Expanded(
//                 child: ListView.builder(
//                   itemCount: controller.products.length,
//                   itemBuilder: (c, i) {
//                     return ListTile(
//                       title: Text(products[i].productName),
//                       subtitle:
//                           Text('${products[i].price} x ${products[i].qty}'),
//                       trailing: Text('\$${products[i].price}'),
//                     );
//                   },
//                 ),
//               );
//             }),
//             Container(
//               color: Colors.teal.shade100,
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       Text(
//                         'Total:-',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       GetX<CartController>(builder: (controller) {
//                         return Text(
//                           '\$${controller.subtotal}',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         );
//                       })
//                     ],
//                   ),
//                   SizedBox(width: 20),
//                   Expanded(
//                     child: FlatButton(
//                       color: Colors.green,
//                       textColor: Colors.white,
//                       child: Text('Print'),
//                       onPressed: () {
//                         // print(products);
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => Print(product)));
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
