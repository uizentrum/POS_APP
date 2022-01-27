import 'package:flutter/material.dart';
import 'package:pointofsale/bottomnv.dart';
import 'package:pointofsale/cart_provider.dart';
import 'package:pointofsale/home.dart';
import 'package:pointofsale/modelcalss/product_list.dart';
import 'package:pointofsale/print.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> CartProvider(),
      child: Builder(builder: (BuildContext context){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColorDark:Colors.black,
      ),
      home:const ProductListScreen(),
      
    );
   }),
  );
 }
}