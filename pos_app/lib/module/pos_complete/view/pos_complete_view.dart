import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pos_app/core.dart';

import 'package:get/get.dart';

class PosCompleteView extends StatelessWidget {
  final controller = Get.put(PosCompleteController());

  @override
  Widget build(BuildContext context) {
    controller.view = this;

    return GetBuilder<PosCompleteController>(
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(
          //   leading: Container(),
          // ),
          body: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width,
                  child: Icon(
                    FontAwesomeIcons.checkCircle,
                    size: 80.0,
                    color: theme.success,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  child: Text("Success"),
                ),
                SizedBox(
                  height: 12.0,
                ),
                ExButton(
                  label: "Back to Home",
                  color: theme.primary,
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
