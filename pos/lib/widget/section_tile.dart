import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTile extends StatelessWidget {
  final String title;
  const SectionTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: GoogleFonts.vollkorn(
                  textStyle: const TextStyle(
                fontSize: 20.0,
                color: Colors.amber,
                fontWeight: FontWeight.normal,
              )),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.arrow_right),
          ),
        ),
      ],
    );
  }
}
