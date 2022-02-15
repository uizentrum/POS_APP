import 'package:flutter/material.dart';
import 'package:tarka/model/category_model.dart';
import 'package:tarka/model/models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroCarosuel extends StatelessWidget {
  final Category? category;
  final Product? product;
  const HeroCarosuel({
    Key? key,
    this.category,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.product == null) {
          Navigator.pushNamed(
            context,
            "/catalog",
            arguments: category,
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 20.h,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  product == null ? category!.imageUrl : product!.imaUrl!,
                  fit: BoxFit.cover,
                  width: 1000.w,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    child: Text(
                        product == null ? category!.name : product!.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
