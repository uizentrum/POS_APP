import 'package:flutter/material.dart';

class MyAppBAr extends StatefulWidget {
  const MyAppBAr({Key? key}) : super(key: key);

  @override
  _MyAppBArState createState() => _MyAppBArState();
}

class _MyAppBArState extends State<MyAppBAr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/icons/arrow.png",
                height: 25,
                width: 25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/icons/search.png",
                  height: 25,
                  width: 25,
                ),
                SizedBox(width: 20.0),
                Image.asset(
                  "assets/icons/menu.png",
                  height: 25,
                  width: 25,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
