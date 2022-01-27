import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/core.dart';
import 'package:pos_app/data/session/app_session.dart';
import 'package:pos_app/module/product_category/controller/product_category_controller.dart';

import 'package:get/get.dart';

class ProductCategoryView extends StatelessWidget {
  final controller = Get.put(ProductCategoryController());

  @override
  Widget build(BuildContext context) {
    controller.view = this;

    return GetBuilder<ProductCategoryController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Product Category"),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ExTextField(
                          id: "category_name",
                          label: "Category Name",
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: ExButton(
                          label: "Add",
                          height: 36.0,
                          onPressed: () {
                            userCollection.collection("categories").add({
                              "category_name": Input.get("category_name"),
                            });
                            textFieldController["category_name"].text = "";
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: userCollection.collection("categories").snapshots(),
                    builder: (context, stream) {
                      if (stream.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
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

                          return InkWell(
                            child: Card(
                              color: Colors.white,
                              child: Container(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Text(item["category_name"]),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        userCollection
                                            .collection("categories")
                                            .doc(item["id"])
                                            .delete();
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.0,
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
        );
      },
    );
  }
}
