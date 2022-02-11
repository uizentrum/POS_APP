import 'package:flutter/material.dart';
import 'package:tarka/widget/custom_appbar.dart';
import 'package:tarka/widget/custom_navbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profiles extends StatelessWidget {
  Profiles({Key? key}) : super(key: key);

  static const String routeName = "/profiles";
  final List<Profiles> product = [];

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => Profiles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blueGrey.shade800,
      appBar: CustomAppBar(title: "Profiles"),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Column(
        children: [
          SizedBox(
            height: 110.h,
            width: 110.w,
            child: CircleAvatar(
              backgroundImage: AssetImage("images/xtz.jpg"),
            ),
          ),
        ],
      ),
    );
  }
}
