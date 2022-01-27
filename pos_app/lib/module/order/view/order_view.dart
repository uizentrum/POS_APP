import 'package:pos_app/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderView extends StatelessWidget {
  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    controller.view = this;

    return GetBuilder<OrderController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Order List"),
          ),
          body: Padding(
            padding: theme.normalPadding,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => controller.updateFilter(0),
                        child: Card(
                          color: controller.selectedFilterIndex == 0
                              ? theme.primary
                              : Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Today",
                              style: TextStyle(
                                color: controller.selectedFilterIndex == 0
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.updateFilter(1),
                        child: Card(
                          color: controller.selectedFilterIndex == 1
                              ? theme.primary
                              : Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Yesterday",
                              style: TextStyle(
                                color: controller.selectedFilterIndex == 1
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.updateFilter(2),
                        child: Card(
                          color: controller.selectedFilterIndex == 2
                              ? theme.primary
                              : Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "All",
                              style: TextStyle(
                                color: controller.selectedFilterIndex == 2
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: userCollection
                        .collection("order")
                        .orderBy("created_at", descending: true)
                        .snapshots(),
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

                          var currentDate = DateFormat("ddMMMy")
                              .format(item["created_at"].toDate());
                          var today =
                              DateFormat("ddMMMy").format(DateTime.now());
                          var yesterday = DateFormat("ddMMMy").format(
                              DateTime.now().subtract(Duration(days: 1)));

                          if (controller.filterStatus == "Today") {
                            if (currentDate != today) {
                              return Container();
                            }
                          } else if (controller.filterStatus == "Yesterday") {
                            if (currentDate != yesterday) {
                              return Container();
                            }
                          }

                          return Container(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(OrderDetailView(
                                      order: item,
                                    ));
                                  },
                                  child: Card(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              QrImage(
                                                data: "${item["id"]}",
                                                version: QrVersions.auto,
                                                size: 40.0,
                                              ),
                                              Spacer(),
                                              Card(
                                                color: theme.primary,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 4.0,
                                                    left: 4.0,
                                                    right: 4.0,
                                                    bottom: 4.0,
                                                  ),
                                                  child: Text(
                                                    "${DateFormat("EEEE, dd MMM y kk:mm").format(item["created_at"].toDate())}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: theme.primary,
                                          ),
                                          RowItem(
                                            label: "Order ID",
                                            value: item["id"],
                                          ),
                                          RowItem(
                                            label: "Pay",
                                            value: "\$${item["pay"]}",
                                          ),
                                          RowItem(
                                            label: "Total",
                                            value: "\$${item["total"]}",
                                          ),
                                          RowItem(
                                            label: "Change",
                                            value: "\$${item["change"]}",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
