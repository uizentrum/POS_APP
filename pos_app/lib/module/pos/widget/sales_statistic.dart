import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos_app/core.dart';
import 'package:pos_app/shared/widget/stream/stream.dart';

class SalesStatistic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExStream(
      stream: userCollection
          .collection("order-total")
          .doc(DateFormat("dd-MMM-y").format(DateTime.now()))
          .snapshots(),
      builder: (doc) {
        var item = doc.data();

        var total = 0.0;
        var count = 0.0;
        if (item != null) {
          total = double.parse("${item["total"]}");
          count = double.parse("${item["count"]}");
        }

        return Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Card(
                  color: theme.warning,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "$total",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Sale(s) Total",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Card(
                  color: theme.success,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "$count",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Sale(s) Count",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
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
  }
}
