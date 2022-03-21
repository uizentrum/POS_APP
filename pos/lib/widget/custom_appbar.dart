import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:google_fonts/google_fonts.dart";

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppBar(
        centerTitle: true,
        // elevation: 8,
        shadowColor: Colors.blueGrey,
        backgroundColor: Colors.blueGrey,
        title: Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Text(
              title,
              style: GoogleFonts.yesevaOne(
                  textStyle: const TextStyle(
                fontSize: 30.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.amber),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/wishlist");
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
