import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos/model/category_model.dart';
import 'package:pos/model/models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroCarosuel extends StatelessWidget {
  final Category? category;
  final Product? product;
  const HeroCarosuel({
    Key? key,
    required this.category,
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
          height: 400,
          width: double.maxFinite,
          child: Container(
            height: 50,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.redAccent,
                    Colors.teal,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadiusDirectional.circular(10.r)),
            child: Center(
              child: Text(
                product == null ? category!.name : product!.name,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),

            // Container(
            //   margin: EdgeInsets.symmetric(
            //     horizontal: 5.w,
            //     vertical: 20.h,
            //   ),
            //   child: ClipRRect(
            //       borderRadius: BorderRadius.all(Radius.circular(10.r)),
            //       child: Stack(
            //         children: <Widget>[
            //           // Image.asset(
            //           //   product == null ? category!.name : product!.name,
            //           //   fit: BoxFit.cover,
            //           //   width: 100.w,
            //           // ),
            //           Positioned(
            //             bottom: 0.0,
            //             left: 0.0,
            //             right: 15,
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 gradient: LinearGradient(
            //                   colors: [
            //                     Colors.redAccent,
            //                     Colors.teal,
            //                   ],
            //                   begin: Alignment.bottomCenter,
            //                   end: Alignment.topCenter,
            //                 ),
            //               ),
            //               padding:
            //                   EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            //               // child: ListView.builder(
            //               //     itemCount:category!.length,
            //               //     itemBuilder: (c, i) {
            //               //       return Card(
            //               //         child: ListTile(
            //               //           title: Text(

            //               //                category!.name

            //               //           ),
            //               //         ),
            //               //       );
            //               //     }),
            //               child: Text(
            //                   product == null ? category!.name : product!.name,
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .headline5!
            //                       .copyWith(color: Colors.white)),
            //             ),
            //           ),
            //         ],
            //       ),
            //       ),
            // ),
          ),
        ));
  }
}
