import 'package:flutter/material.dart';
import 'package:pos/model/category_model.dart';
import 'package:pos/model/product_model.dart';
import 'package:pos/widget/widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatalogScreen extends StatelessWidget {
  static const String? routeName = "/catalog";

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;
  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(
        screen: '/catalog',
      ),
      body: GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 16.w,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2.58),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProducutCard(
                product: categoryProducts[index],
                widthFactor: 2.24,
              ),
            );
          }),
    );
  }
}
   