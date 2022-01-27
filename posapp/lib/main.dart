import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/links/appetizer.dart';
import 'package:travelapp/links/basketpage.dart';
import 'package:travelapp/links/colors.dart';
import 'package:travelapp/links/destinations.dart';
import 'package:travelapp/links/drinks.dart';
import 'package:travelapp/links/hotels.dart';
// import 'package:travelapp/links/iconsbar.dart';
import 'package:travelapp/links/tabbar.dart';
import 'package:travelapp/models/itemCountModel.dart';
import 'package:travelapp/models/tryModel.dart';
import 'package:travelapp/main.dart';

void main() {
  runApp(
    MaterialApp(
     // final myKey: GlobalKey>
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.roboto().fontFamily),
      home: MyApp(),

    ),
  );
}

class MyApp extends StatefulWidget {
  // int qty = 0;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ItemCountModel> countDataForSearch = [ItemCountModel(0)];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
  
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            bottom: const TabBar(
              isScrollable: true,
              labelColor: Colors.red,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              tabs: [
                Tab(
                  child: Text("Main Course"),
                ),
                Tab(
                  child: Text("Appetizer"),
                ),
                Tab(
                  child: Text("Drink"),
                ),
                Tab(
                  child: Text("Vorspeisen"),
                ),
                Tab(
                  child: Text("Hauptegericht"),
                ),
                Tab(
                  child: Text("Desserts"),
                ),
              ],
            ),
            title: const Text(
              'Menu',
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
          body:  TabBarView(
            children: [
              // Myhotels(),
              // Appetizer(),
              Myhotels(),
              Appetizers(),
              Drinks(),

              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
