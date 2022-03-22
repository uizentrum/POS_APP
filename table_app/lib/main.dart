import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_app/pages/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'POS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    print("---------Main Page------------------");
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Container(
            color: Colors.blueGrey,
            child: Container(
              margin: EdgeInsets.only(
                top: 40,
                bottom: 10,
              ),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Kathmandu",
                      ),
                      Row(
                        children: [
                          Text(
                            "Kapan",
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff89dad0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // body section
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
