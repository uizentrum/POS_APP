import 'package:flutter/material.dart';
import 'package:pos_app/core.dart';

import 'package:get/get.dart';

class PosCheckoutView extends StatelessWidget {
  final Map<String, dynamic> orderDetail;
  final List orderItems;
  final double total;

  PosCheckoutView({
    @required this.orderDetail,
    @required this.orderItems,
    @required this.total,
  });

  final controller = Get.put(PosCheckoutController());

  @override
  Widget build(BuildContext context) {
    controller.view = this;
    controller.orderDetail = orderDetail;
    controller.orderItems = orderItems;
    controller.total = total;

    return GetBuilder<PosCheckoutController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Checkout"),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ListView.builder(
                    itemCount: orderItems.length,
                    itemBuilder: (context, index) {
                      var item = orderItems[index];

                      return Card(
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              Image.network(
                                item['photo'] ?? DataSession.noPhotoUrl,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  return CustomImageBuilder
                                      .getImageLoadingBuilder(
                                          context, child, loadingProgress);
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  height: 50.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Spacer(),
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
                                      Row(
                                        children: [
                                          Text(
                                            "\$${item["price"]}",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: 38.0,
                                            child: Center(
                                              child: Text(
                                                "x ${item["qty"]}",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.grey[200],
                width: Get.width,
                child: Column(
                  children: [
                    ExRowTextField(
                      id: "pay",
                      label: "Pay",
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                      format: TextFieldFormat.money,
                      value: total.toString(),
                      // onSubmitted: (value) => controller.onInputValue(),
                      onChanged: (value) => controller.onInputValue(),
                    ),
                    ExRowTextField(
                      id: "change",
                      label: "Change",
                      textAlign: TextAlign.right,
                      format: TextFieldFormat.money,
                      keyboardType: TextInputType.number,
                      enabled: false,
                      value: "0".toString(),
                      onSubmitted: (value) => controller.onInputValue(),
                    ),
                  ],
                ),
              ),
              Container(
                color: theme.disabled,
                width: Get.width,
                padding: theme.normalPadding,
                child: Row(
                  children: [
                    Text(
                      "Total: \$$total",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      width: 100.0,
                    ),
                    Expanded(
                      child: ExButton(
                        label: "Save",
                        height: 40.0,
                        onPressed: () => controller.save(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
