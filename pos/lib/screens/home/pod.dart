import 'package:flutter/material.dart';
import 'package:pos/model/models.dart';

class Prod extends StatelessWidget {
  const Prod({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("product"),
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
                          itemCount: Product.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
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
                                    Product.products[index].name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    Product.products[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
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
