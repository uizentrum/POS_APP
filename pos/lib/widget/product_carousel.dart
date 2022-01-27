import 'package:flutter/material.dart';
import 'package:tarka/model/product_model.dart';
import 'package:tarka/widget/product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
   const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: ProducutCard(
                product: products[index],
              ),
            );
          }),
    );
  }
}
