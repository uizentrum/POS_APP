import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:pos_app/core.dart';
import 'package:get/get.dart';

class PosCheckoutController extends GetxController {
  PosCheckoutView view;
  Map<String, dynamic> orderDetail;
  List orderItems;
  double total;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  save() async {
    var pay = double.parse(Input.get("pay"));
    var change = double.parse(Input.get("change"));

    if (change < 0) {
      print("change: $change");
      showSnackbar(message: "Insufficient amount of payment");
      return;
    }

    orderDetail["total"] = total;
    orderDetail["pay"] = pay;
    orderDetail["change"] = change;
    orderDetail["order_items"] = orderItems;

    showLoading();
    await userCollection.collection("order").add(orderDetail);

    var doc = await userCollection
        .collection("order-total")
        .doc(DateFormat("dd-MMM-y").format(DateTime.now()))
        .get();
    if (doc.exists) {
      await userCollection
          .collection("order-total")
          .doc(DateFormat("dd-MMM-y").format(DateTime.now()))
          .update({
        "total": FieldValue.increment(total),
        "count": FieldValue.increment(1),
      });
    } else {
      await userCollection
          .collection("order-total")
          .doc(DateFormat("dd-MMM-y").format(DateTime.now()))
          .set({
        "total": FieldValue.increment(total),
        "count": FieldValue.increment(1),
      });
    }

    hideLoading();

    PosController posController = Get.find();
    posController.resetState();
    Get.back();

    Get.to(PosCompleteView());
  }

  onInputValue() {
    var pay = Input.get("pay");
    var change = double.parse(pay) - total;
    exRowTextFieldState["change"].setValue(change.toString());
  }
}
