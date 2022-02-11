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
    Timer(Duration(seconds: 1), () => Navigator.pushNamed(context, "/"));
    return Scaffold(
      backgroundColor:Colors.blueGrey.shade800,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              child: Image(
                image: AssetImage("assets/main.jpg"),
                width: 300.w,
                height: 300.h,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40.h,
            width: 100.w,
            color: Colors.black,
            child: Text(
              "Welcome",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
