import 'package:get/get.dart';
import 'package:pos_app/core.dart';
import 'package:pos_app/module/product_form/view/product_form_view.dart';
import 'package:pos_app/shared/util/input/input.dart';

class ProductFormController extends GetxController {
  ProductFormView view;

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
    var photo = Input.get("photo");
    var productName = Input.get("product_name");
    var price = Input.get("price");
    var categoryName = Input.get("category_name");

    showLoading();
    if (view.item == null) {
      await userCollection.collection("products").add({
        "product_name": productName,
        "photo": photo,
        "price": price,
        "category_name": categoryName,
      });
    } else {
      await userCollection.collection("products").doc(view.item["id"]).update({
        "product_name": productName,
        "photo": photo,
        "price": price,
        "category_name": categoryName,
      });
    }
    hideLoading();
    Get.back();
  }

  delete() async {
    showLoading();
    await userCollection.collection("products").doc(view.item["id"]).delete();
    hideLoading();
    Get.back();
  }
}
