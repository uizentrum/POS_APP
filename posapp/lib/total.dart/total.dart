// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:travelapp/models/itemCountModel.dart';
// import '../models/tryModel.dart';
// import 'order.dart';


// class Basket extends StatefulWidget {
//   List countt;
//   List basketData;
//   List selectedItemList;

//   Basket(this.countt, this.basketData, this.selectedItemList);
//   @override
//   _CheckoutWidgetState createState() =>
//       _CheckoutWidgetState(this.countt, this.basketData, this.selectedItemList);
// }

// List store = [];

// Cart selectedItem;
// int decimals = 2;
// int fac = pow(10, decimals);

// class _CheckoutWidgetState extends State<Basket> {
//   List countt;
//   List basketData;
//   List selectedItemList;
//   _CheckoutWidgetState(this.countt, this.basketData, this.selectedItemList);
//   List<DropdownMenuItem<Cart>> _dropdownMenuItems;

//   double minCost = 0; //minimum required cost for order
//   var actualPrice;
//  final grandTotal = 0;
//  double subtotal = 0.0;
//   double total = 0;
//   dynamic delCharge = 0;
//   //grandTotal = grandTotal + int.parse(total) + int.parse(delCharge);

//   @override
//   void initState() {
//     super.initState();
//     List<Cart> _dropdownItems = [ItemCountModel
//     ];
//     selectedItem = selectedItemList[0];

//     for (var i = 0; i < _dropdownItems.length; i++) {
//       if (_dropdownItems[i].name == selectedItem.name) {
//         _dropdownItems.removeAt(i);
//         _dropdownItems.insert(i, selectedItemList[0]);
//         break;
//       }
//       print("1111111111111111111111111111111111111111111111111111");
//       print(selectedItem);
//       print(selectedItemList);
//       // if(selectedItemList == ){

//       // }
//     }
//     _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
//     //selectedItem = _dropdownMenuItems[0].value;
//   }

//   List<DropdownMenuItem<Cart>> buildDropDownMenuItems(List listItems) {
//     List<DropdownMenuItem<Cart>> items = List();
//     for (Cart listItem in listItems) {
//       items.add(
//         DropdownMenuItem(
//           child: Text(listItem.name),
//           value: listItem,
//         ),
//       );
//     }
//     return items;
//   }

//   @override
//   Widget build(BuildContext context) {
//     //Map<String, String> _productNamePrice = Map<String, String>();

//     return WillPopScope(
//       onWillPop: () async => false,
//       child: ChangeNotifierProvider(
//         create: (context) => TryModel(),
//         builder: (context, child) => Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'Basket',
//               style: TextStyle(color: Colors.white),
//             ),
//             leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 store.clear();
//                 store.add(countt);
//                 store.add(selectedItem);
//                 print('----------------------><-----------------------');
//                 print(store);
//                 print(selectedItem.toString());
//                 // showBasketBar = true;
//                 // basketPageIsPressed = true;
//                 Navigator.pop(context, store);
//               },
//             ),
//           ),
//           body: SafeArea(
//             child: Center(
//               child: Consumer<TryModel>(
//                 builder: (context, data, child) => Column(
//                   children: <Widget>[
//                     Expanded(
//                       child: ListView.builder(
//                           itemCount: basketData.length,
//                           itemBuilder: (BuildContext context, int count) {
//                             //String key = _productNamePrice.keys.elementAt(count);

//                             return Dismissible(
//                               direction: DismissDirection.endToStart,
//                               key: UniqueKey(),
//                               background: Container(
//                                   color: Colors.red,
//                                   child: Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Icon(
//                                         Icons.remove_shopping_cart_outlined,
//                                         size: 40.0,
//                                       ))),
//                               onDismissed: (direction) {
//                                 //  removeFromCart(key);
//                                 setState(() {
//                                   countt[0].itemCount = countt[0].itemCount -
//                                       basketData[count].itemIndexCount;
//                                   basketData.removeAt(count);
//                                //   selectedItem.deliveryCharge = 0;
//                                 });
//                               },
//                               child: Card(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(15.0),
//                                   child: Column(children: [
//                                     ListTile(
//                                         onTap: () {
//                                           print(basketData[count].productId);
//                                           print(basketData[count].taxClass);
//                                         },
//                                         leading: Text('x ${basketData[count]
//                                             .itemIndexCount
//                                             .toString()}'),
//                                         title: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(basketData[count].productName),
//                                             SizedBox(height: 5),
//                                             // Text(
//                                             //   parse(basketData[count]
//                                             //           .description)
//                                             //       .documentElement
//                                             //       .text,
//                                             //   style: TextStyle(
//                                             //       fontSize: 14.0,
//                                             //       color: Colors.grey),
//                                             // ),
//                                           ],
//                                         ),
//                                         subtitle: basketData[count].choice != null? Text(basketData[count].choice): Container(),
//                                         trailing: Text(
//                                             (((basketData[count].price) * fac)
//                                                         .round() /
//                                                     fac)
//                                                 .toString())

//                                         ///'${_productNamePrice[key].toString()} €'),
//                                         ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         // InkWell(
//                                         //   child: Text('Add Note',
//                                         //       style: TextStyle(color: Colors.blue)),
//                                         //   onTap: () {},
//                                         // ),
//                                         Container(
//                                           child: Row(children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 //calculating actual price

//                                                 actualPrice =
//                                                     basketData[count].price /
//                                                         basketData[count]
//                                                             .itemIndexCount;
//                                                 setState(() {
//                                                   //substraction
//                                                   //subtracting price
//                                                   basketData[count].price =
//                                                       basketData[count].price -
//                                                           actualPrice;

//                                                   //subtracting itemindexcount
//                                                   basketData[count]
//                                                           .itemIndexCount =
//                                                       basketData[count]
//                                                               .itemIndexCount -
//                                                           1;
//                                                   countt[0].itemCount =
//                                                       countt[0].itemCount - 1;

//                                                   if (basketData[count]
//                                                           .itemIndexCount ==
//                                                       0) {
//                                                     basketData.removeAt(count);
//                                                   }
//                                                 });
//                                               },
//                                               child: Icon(Icons.remove,
//                                                   color: Colors.orange[800]),
//                                             ),
//                                             SizedBox(width: 10.0),
//                                             InkWell(
//                                                 onTap: () {
//                                                   //addition
//                                                   actualPrice =
//                                                       basketData[count].price /
//                                                           basketData[count]
//                                                               .itemIndexCount;

//                                                   setState(() {
//                                                     //addition
//                                                     //addition price
//                                                     basketData[count].price =
//                                                         basketData[count]
//                                                                 .price +
//                                                             actualPrice;

//                                                     //addition itemindexcount
//                                                     basketData[count]
//                                                             .itemIndexCount =
//                                                         basketData[count]
//                                                                 .itemIndexCount +
//                                                             1;
//                                                     countt[0].itemCount =
//                                                         countt[0].itemCount + 1;
//                                                   });
//                                                 },
//                                                 child: Icon(Icons.add,
//                                                     color: Colors.orange[800])),
//                                           ]),
//                                         )
//                                       ],
//                                     )
//                                     // Text("Item Name: "+key, style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 21.0),),
//                                     // Text("Price: "+_productNamePrice[key].toString()+"\$", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 21.0))
//                                   ]),
//                                 ),
//                               ),
//                             );
//                           }),
//                     ),
//                     // Divider(),

//                     Container(
//                       padding: const EdgeInsets.all(15.0),
//                       // color: Colors.grey[200],
//                       child: Column(
                        
//                         children: [
//                         // Row(
//                         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //   children: [
//                         //     Text("Subtotal"), Text("${getTotal()}")
                    
//                         //     ],
//                         // ),
//                         // SizedBox(height: 5.0),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Post Code"),
//                             DropdownButtonHideUnderline(
//                               child: DropdownButton(
//                                 hint: Text('Select'),
//                                 value: selectedItem,
//                                 items: _dropdownMenuItems,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedItem = value;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
                    
//                          SizedBox(height: 5.0),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Subtotal",
//                               // style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(" ${getTotal()}€")
//                           ],
//                         ),
//                         SizedBox(height: 5.0),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Delivery Charge",
//                               // style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Text(" ${selectedItem.deliveryCharge.toString()}€")
//                           ],
//                         ),
//                         SizedBox(height: 5.0),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Total",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
                          
//                           ],
//                         ),
//                       ]),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     (total) < (minCost = selectedItem.price.toDouble()) ||
//                             total < 10.00
//                         ? Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: Container(
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     width: double.infinity,
//                                     padding: EdgeInsets.all(15.0),
//                                     decoration: BoxDecoration(
//                                       // border: Border.all(
//                                       //   color: Colors.amberAccent,
//                                       //   width: 10,
//                                       // ),
//                                       color: Colors.amber[200],
//                                     ),
//                                     child: Row(
//                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             "Remaining amount to reach minimum \norder value",
//                                             style: TextStyle(fontSize: 12.0),
//                                           ),
//                                         ),
//                                         //  Text(
//                                         //   '${minCost - (total)}€ and ${_selectedItem.price}€',
//                                         //   style: TextStyle(fontSize: 12.0),
//                                         // ),
//                                         conv(selectedItem.price, total)
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10.0,
//                                   ),
//                                   Container(
//                                       width:
//                                           MediaQuery.of(context).size.width / 1,
//                                       child: Text(
//                                         "Unfortunately, we cannot ship yet for your location, Inderheld ShahJahan Restaurant delivers orders starting from a minimum order value of ${selectedItem.price}€ (excl. delivery cost)",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w300,
//                                             fontSize: 9.0),
//                                       )),
//                                   // SizedBox(
//                                   //   height: 10.0,
//                                   // ),
//                                   // Divider(),
//                                   // Spacer(),
//                                 ],
//                               ),
//                             ),
//                           )
//                         : Container(
//                             child: Text(""),
//                           ),

//                     (total) < (minCost = selectedItem.price.toDouble()) ||
//                             total == 0
//                         ? ButtonTheme(
//                             buttonColor: Colors.white,
//                             height: 50.0,
//                             minWidth: double.infinity,
//                             child: RaisedButton(
//                               elevation: 0.0,
//                               color: Colors.white,
//                               onPressed: () {
//                                 store.clear();
//                                 store.add(countt);
//                                 store.add(selectedItem);
//                                 print(
//                                     '----------------------><-----------------------');
//                                 print(store);
//                                 Navigator.pop(context, store);
//                               },
//                               child: Text(
//                                 "Add more Items",
//                                 style: TextStyle(
//                                     color: Colors.orange[800], fontSize: 18.0),
//                               ),
//                             ),
//                           )
//                         //CheckOut(selectedItem)
//                         : ButtonTheme(
//                             buttonColor: Colors.orange[800],
//                             height: 50.0,
//                             minWidth: double.infinity,
//                             child: RaisedButton(
//                               elevation: 0.0,
//                               color: Colors.orange[800],
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           CheckOut(selectedItem)),
//                                 );
//                               },
//                               child: Text(
//                                 "Checkout  ${total + selectedItem.deliveryCharge}€",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 18.0),
//                               ),
//                             ),
//                           )
//                     // ListTile(
//                     //   title: Text("Total Price"),
//                     //   subtitle: Text(total.toString()+"\$"),
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget conv(var a, var b) {
//     var c = a - b;
//     c = (c * fac).round() / fac;
//     return Text(
//       '$c €',
//       style: TextStyle(fontSize: 12.0),
//     );
//   }

//   Widget del(var a) {
//     var b = a;
//     // c = (c * fac).round() / fac;
//     return Text(
//       '$b €',
//       style: TextStyle(fontSize: 12.0),
//     );
//   }

//   getTotal() {
//     if (total != null) {
//       total = 0;
//     }
//     for (var i = 0; i < basketData.length; i++) {
//       total = total + basketData[i].price;
//       total = (total * fac).round() / fac;

//       // print('------------------>total here<--------------------');
//       // print(total);
//     }
//     SharedService.Save(total);
//     // if(selectedItem == selectedItemList[2]){
//     //   return total+2;
//     // }
//     return total;
//   }

//   getDel() {
//     if (delCharge != null) {
//       delCharge = 0;
//     }
//     for (var i = 0; i < basketData.length; i++) {
//       delCharge = delCharge + basketData[i].deliveryCharge;
//      // delCharge = (delCharge * fac).round() / fac;

//       // print('------------------>total here<--------------------');
//       // print(total);
//     }
//    // SharedService.Save(delCharge);
//     // if(selectedItem == selectedItemList[2]){
//     //   return total+2;
//     // }
//     return delCharge;
//   }
// }
