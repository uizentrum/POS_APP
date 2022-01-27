import 'package:flutter/material.dart';
import 'package:pos_app/module/help/controller/help_controller.dart';

import 'package:get/get.dart';

class HelpView extends StatelessWidget {
  final controller = Get.put(HelpController());

  @override
  Widget build(BuildContext context) {
    controller.view = this;

    return GetBuilder<HelpController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Help"),
          ),
        );
      },
    );
  }
}
