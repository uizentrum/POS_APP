import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pos_app/core.dart';

import 'package:get/get.dart';
import 'package:pos_app/module/help/view/help_view.dart';
import 'package:pos_app/module/pos/widget/sales_statistic.dart';
import 'package:pos_app/module/product_category/view/product_category_view.dart';
import 'package:pos_app/shared/widget/dashboard_menu/dashboard_menu.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PosView extends StatelessWidget {
  final controller = Get.put(PosController());

  @override
  Widget build(BuildContext context) {
    controller.view = this;

    return GetBuilder<PosController>(
      builder: (_) {
        if (controller.loading)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );

        if (controller.orderDetail == null)
          return Scaffold(
            appBar: AppBar(
              title: Text("POS v1"),
            ),
            body: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SalesStatistic(),
                SizedBox(
                  height: 16.0,
                ),
                DashboardMenu(
                  items: [
                    MenuItem(
                      icon: FontAwesomeIcons.cashRegister,
                      label: "POS",
                      color: theme.primary,
                      onTap: () => controller.createNewOrder(),
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.boxOpen,
                      label: "Product",
                      color: Colors.green,
                      onTap: () => Get.to(ProductView()),
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.boxes,
                      label: "Product Category",
                      color: Colors.orange,
                      onTap: () => Get.to(ProductCategoryView()),
                    ),
                    MenuItem(
                      icon: FontAwesomeIcons.infoCircle,
                      label: "Help",
                      color: Colors.blue,
                      onTap: () => Get.to(HelpView()),
                    ),
                    //! Coming Soon
                    // MenuItem(
                    //   icon: FontAwesomeIcons.chartBar,
                    //   label: "Sales Report",
                    //   color: Colors.purple,
                    //   onTap: () => Get.to(SalesReportView()),
                    // ),
                  ],
                ),
              ],
            ),
          );

        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                QrImage(
                  data: "${controller.orderDetail["id"]}",
                  version: QrVersions.auto,
                  size: 50.0,
                ),
                Text("Pos"),
              ],
            ),
            actions: [
              InkWell(
                onTap: () => controller.updateFilter("Your Order"),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        color: controller.categoryNameFilter == "Your Order"
                            ? theme.primary
                            : null,
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Center(
                        child: Text(
                          "${controller.orderItems.isEmpty ? "" : "${controller.orderItems.length} items"}",
                          style: TextStyle(
                            fontSize: 11.0,
                            color: controller.categoryNameFilter == "Your Order"
                                ? theme.primary
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => controller.resetState(),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
                  child: Icon(
                    Icons.cancel,
                    color: theme.primary,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              //Menu
              Container(
                height: 40.0,
                child: StreamBuilder(
                  initialData: controller.categoryList,
                  builder: (context, stream) {
                    if (stream.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (stream.hasError) {
                      print(stream.error);
                      return Center(child: Text(stream.error.toString()));
                    }

                    QuerySnapshot querySnapshot = stream.data;

                    if (querySnapshot == null) {
                      return Center(child: Text(stream.error.toString()));
                    }

                    return Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: ListView.builder(
                        itemCount: querySnapshot.size,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var item = querySnapshot.docs[index].data();
                          item["id"] = querySnapshot.docs[index].id;

                          return Container(
                            child: Wrap(
                              children: [
                                if (index == 0)
                                  InkWell(
                                    onTap: () => controller.updateFilter("All"),
                                    child: Card(
                                      color:
                                          controller.categoryNameFilter == "All"
                                              ? theme.primary
                                              : Colors.transparent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "All",
                                          style: TextStyle(
                                            fontSize: 11.0,
                                            color:
                                                controller.categoryNameFilter ==
                                                        "All"
                                                    ? Colors.white
                                                    : null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                InkWell(
                                  onTap: () => controller
                                      .updateFilter(item["category_name"]),
                                  child: Card(
                                    color: controller.categoryNameFilter ==
                                            item["category_name"]
                                        ? theme.primary
                                        : Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${item["category_name"]}",
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          color:
                                              controller.categoryNameFilter ==
                                                      "${item["category_name"]}"
                                                  ? Colors.white
                                                  : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              if (controller.productList != null)
                Expanded(
                  child: StreamBuilder(
                    initialData: controller.productList,
                    builder: (context, stream) {
                      if (stream.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (stream.hasError) {
                        print(stream.error);
                        return Center(child: Text(stream.error.toString()));
                      }

                      QuerySnapshot querySnapshot = stream.data;
                      return Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: ListView.builder(
                          itemCount: querySnapshot.size,
                          itemBuilder: (context, index) {
                            var item = querySnapshot.docs[index].data();
                            item["id"] = querySnapshot.docs[index].id;

                            if (controller.categoryNameFilter != "All" &&
                                controller.categoryNameFilter != "Your Order") {
                              if (item["category_name"] !=
                                  controller.categoryNameFilter) {
                                return Container();
                              }
                            }

                            var searchList = controller.orderItems
                                .where((p) =>
                                    p["product_name"] == item["product_name"])
                                .toList();

                            var orderItem;
                            var qty = 0;
                            if (searchList.isNotEmpty) {
                              orderItem = searchList[0];
                              qty = orderItem["qty"];

                              if (controller.categoryNameFilter ==
                                  "Your Order") {
                                if (qty == 0) return Container();
                              }
                            }

                            if (controller.categoryNameFilter == "Your Order") {
                              if (qty == 0) return Container();
                            }

                            return Card(
                              color: Colors.white,
                              child: Container(
                                padding: EdgeInsets.all(6.0),
                                child: Row(
                                  children: [
                                    Image.network(
                                      item['photo'] ?? DataSession.noPhotoUrl,
                                      height: 100,
                                      width: Get.width / 4,
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
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Spacer(),
                                                InkWell(
                                                  onTap: () => controller
                                                      .addItemQty(item),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        theme.disabled,
                                                    radius: 12,
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 12.0,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 38.0,
                                                  child: Center(
                                                    child: Text(
                                                      "$qty",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () => controller
                                                      .subtractItemQty(item),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        theme.disabled,
                                                    radius: 12,
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 12.0,
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
                      );
                    },
                  ),
                ),
              Container(
                color: theme.disabled,
                width: Get.width,
                padding: theme.normalPadding,
                child: Row(
                  children: [
                    Text(
                      "Total: \$${controller.total}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    Spacer(),
                    ExButton(
                      label: "Checkout",
                      height: 40.0,
                      onPressed: () => Get.to(PosCheckoutView(
                        orderDetail: controller.orderDetail,
                        orderItems: controller.orderItems,
                        total: controller.total,
                      )),
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
