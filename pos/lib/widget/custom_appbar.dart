import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          color: Colors.transparent,
          child: Padding(
            padding:
               EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.amber),
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
  Size get preferredSize => Size.fromHeight(58.h);
}
