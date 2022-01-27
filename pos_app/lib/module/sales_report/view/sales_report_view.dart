import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/data/session/app_session.dart';
import 'package:pos_app/module/sales_report/controller/sales_report_controller.dart';

import 'package:get/get.dart';

class SalesReportView extends StatelessWidget {
  final controller = Get.put(SalesReportController());

  @override
  Widget build(BuildContext context) {
    controller.view = this;

    return GetBuilder<SalesReportController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Sales Report - Coming Soon"),
          ),
          body: StreamBuilder(
            stream: userCollection.collection("categories").snapshots(
              includeMetadataChanges: true,
            ),
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
        );
      },
    );
  }
}
