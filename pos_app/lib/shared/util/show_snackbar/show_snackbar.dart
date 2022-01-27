import 'package:pos_app/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackbar({
  String title = "Info",
  String message = "",
  IconData icon = Icons.info,
  Color backgroundColor,
}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor ?? theme.mainColor,
    colorText: Colors.white,
    icon: Icon(icon),
  );
}
