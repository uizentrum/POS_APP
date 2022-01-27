import 'package:pos_app/core.dart';
import 'package:get/get.dart';

enum AlertType {
  success,
  info,
  warning,
}

showAlert({
  String message,
  AlertType alertType = AlertType.success,
}) async {
  await Get.dialog(AlertTemplate(
    message: message,
    alertType: alertType,
  ));
}
