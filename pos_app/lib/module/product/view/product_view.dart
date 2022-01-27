import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos_app/core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pos_app/module/product_form/view/product_form_view.dart';
import 'package:pos_app/shared/widget/radio/stream_radio.dart';
import 'package:pos_app/shared/widget/search_bar/search_bar.dart';

class ProductView extends StatelessWidget {
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    controller.view = this;

    return GetBuilder<ProductController>(
      builder: (_) {
        return WillPopScope(
          onWillPop: () {
            controller.search = "";
            return Future.value(true);
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text("Product"),
              actions: [
                if (controller.search.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        controller.search = "";
                        controller.update();
                      },
                      child: Card(
                        color: theme.warning,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            top: 4.0,
                            bottom: 4.0,
                          ),
                          child: Center(
                            child: Text(
                              "Search: ${controller.search}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                SearchIcon(
                  id: "product_search",
                  onSearch: (search) {
                    log("Search : $search");
                    controller.search = search;
                    controller.update();
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => Get.to(ProductFormView()),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Column(
                children: [
                  ExStreamRadio(
                    id: "category_name_filter",
                    label: "Category",
                    valueField: "category_name",
                    labelField: "category_name",
                    stream: userCollection.collection("categories").snapshots(),
                    onChanged: (value) {
                      controller.categoryNameFilter = value;
                      controller.update();
                    },
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: userCollection.collection("products").snapshots(),
                      builder: (context, stream) {
                        if (stream.connectionState == ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (stream.hasError) {
                          print(stream.error);
                          return Center(child: Text(stream.error.toString()));
                        }

                        QuerySnapshot querySnapshot = stream.data;
                        return ListView.builder(
                          itemCount: querySnapshot.size,
                          itemBuilder: (context, index) {
                            var item = querySnapshot.docs[index].data();
                            item["id"] = querySnapshot.docs[index].id;

                            if (controller.categoryNameFilter != null) {
                              if (item["category_name"] !=
                                  controller.categoryNameFilter) {
                                return Container(color: Colors.red,);
                              }
                            }

                            if (controller.search != null) {
                              log("search >>> ${controller.search}");
                              if (controller.search.isNotEmpty &&
                                  !item["product_name"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(
                                          controller.search.toLowerCase())) {
                                return Container();
                              }
                            }

                            return InkWell(
                              onTap: () {
                                Get.to(ProductFormView(
                                  item: item,
                                ));
                              },
                              child: Card(
                                color: Colors.white,
                                child: Container(
                                  padding: EdgeInsets.all(6.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        item['photo'] ?? DataSession.noPhotoUrl,
                                        height: 100,
                                        width: 100.0,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          return CustomImageBuilder
                                              .getImageLoadingBuilder(context,
                                                  child, loadingProgress);
                                        },
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 100.0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("${item["product_name"]}"),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "${item["category_name"]}",
                                                style: TextStyle(
                                                  fontSize: 8.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.0,
                                              ),
                                              Text(
                                                "\$${item["price"]}",
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
