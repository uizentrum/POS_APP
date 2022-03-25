import 'package:flutter/material.dart';
import 'package:pos/model/category_model.dart';
import 'package:pos/model/product_model.dart';
import 'package:pos/screens/home/pod.dart';

class cate extends StatelessWidget {
  const cate({
    Key? key,
    required this.category,
  }) : super(key: key);
  final Category category;

  get product => product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("categories"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        "list of categories",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      color: Colors.grey,
                      height: 866,
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 10,
                          ),
                          itemCount: Category.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Prod(
                                            product: product,
                                          )),
                                );
                              },
                              child: Container(
                                width: double.maxFinite,
                                height: 60,
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blueGrey,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      Category.categories[index].name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      // child: PageView.builder(
                      //     controller: pageController,
                      //     itemCount: popularProducts.popularProductList.length,
                      //     itemBuilder: (context, positiion) {

                      //       return _buildPageItem(positiion,
                      //           popularProducts.popularProductList[positiion]);
                      //     }),
                    ),
                    // SectionTile(title: "Recommended"),
                    // ProductCarousel(
                    //     products: Product.products
                    //         .where((product) => product.isRecommended)
                    //         .toList()),
                    // SectionTile(title: "Popular"),
                    // ProductCarousel(
                    //     products: Product.products
                    //         .where((product) => product.isPopular)
                    //         .toList()),
                    // SectionTile(title: "Recently added"),
                    // ProductCarousel(
                    //     products: Product.products
                    //         .where(
                    //           (product) => product.isRecentlyadded,
                    //         )
                    //         .toList()),
                    // SectionTile(title: "Drink"),
                    // ProductCarousel(
                    //     products: Product.products
                    //         .where((product) => product.isDrink)
                    //         .toList()),
                    // SectionTile(title: "Vegan-Category"),
                    // ProductCarousel(
                    //     products: Product.products
                    //         .where(
                    //           (product) => product.isRecentlyadded,
                    //         )
                    //         .toList()),
                    // SectionTile(title: "Snacks"),
                    // ProductCarousel(
                    //   products: Product.products
                    //       .where((product) => product.isDrink)
                    //       .toList(),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
