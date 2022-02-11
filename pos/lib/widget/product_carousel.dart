import 'package:flutter/material.dart';
import 'package:tarka/model/product_model.dart';
import 'package:tarka/widget/product_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
          physics:BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h,),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.only(right: 5.w,),
              child: ProducutCard(
                product: products[index],
              ),
            );
          }),
    );
  }
}
