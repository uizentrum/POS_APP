import 'package:flutter/material.dart';
import 'package:pos_app/core.dart';
import 'package:pos_app/module/product_form/controller/product_form_controller.dart';

import 'package:get/get.dart';
import 'package:pos_app/shared/widget/image_picker/ex_firestore_image_picker.dart';
import 'package:pos_app/shared/widget/radio/stream_radio.dart';

class ProductFormView extends StatelessWidget {
  final Map item;
  ProductFormView({
    this.item = const {},
  });

  final controller = Get.put(ProductFormController());

  @override
  Widget build(BuildContext context) {
    controller.view = this;


    return GetBuilder<ProductFormController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Product Form"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: ExButton(
                  label: "Delete",
                  onPressed: () => controller.delete(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ExButton(
                  label: "Save",
                  onPressed: () => controller.save(),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: theme.normalPadding,
            child: Column(
              children: [
                ExFirestoreImagePicker(
                  id: "photo",
                  label: "Photo",
                  value: item["photo"],
                ),
                ExTextField(
                  id: "product_name",
                  label: "Product Name",
                  value: item["product_name"],
                ),
                ExTextField(
                  id: "price",
                  label: "Price",
                  keyboardType: TextInputType.number,
                  value: item["price"].toString(),
                ),
                ExStreamRadio(
                  id: "category_name",
                  label: "Category",
                  valueField: "category_name",
                  labelField: "category_name",
                  stream: userCollection.collection("categories").snapshots(),
                  value: item["category_name"],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
