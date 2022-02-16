import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash";

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, "/"));
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 100.sp,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("images/pos.png"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Point Of Sale",
            style: TextStyle(
                color: Colors.amber,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
