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
      backgroundColor:Colors.blueGrey.shade800,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/main.jpg"),
              
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
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
