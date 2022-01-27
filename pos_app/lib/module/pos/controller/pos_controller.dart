import 'package:pos_app/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class PosController extends GetxController {
  PosView view;
  bool loading = true;
  String categoryNameFilter = "All";
  Map<String, dynamic> orderDetail;
  List orderItems = [];
  QuerySnapshot productList;
  QuerySnapshot categoryList;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadData() async {
    productList = await userCollection.collection("products").get();
    categoryList = await userCollection.collection("categories").get();
    loading = false;
    update();
  }

  updateFilter(value) async {
    categoryNameFilter = value;
    update();
  }

  addItemQty(Map addedItem) {
    var searchList = orderItems
        .where((p) => p["product_name"] == addedItem["product_name"])
        .toList();

    if (searchList.isEmpty) {
      var item = addedItem;
      item["qty"] = 1;
      orderItems.add(item);
    } else {
      var item = searchList[0];
      item["qty"] = item["qty"] + 1;
      searchList[0] = item;
    }

    update();
  }

  subtractItemQty(Map addedItem) {
    var searchList = orderItems
        .where((p) => p["product_name"] == addedItem["product_name"])
        .toList();

    if (searchList.isEmpty) {
      var item = addedItem;
      item["qty"] = 0;
      orderItems.add(item);
    } else {
      var item = searchList[0];
      item["qty"] = item["qty"] - 1;
      item["qty"] = item["qty"] < -1 ? 0 : item["qty"];
      searchList[0] = item;

      if (item["qty"] == 0) {
        orderItems.remove(searchList[0]);
      }
    }

    update();
  }

  double get total {
    double total = 0;
    orderItems.forEach((item) {
      total += item["price"] * item["qty"] * 1.0;
    });
    return total;
  }

  createNewOrder() {
    orderDetail = {
      "id": Uuid().v4().toString(),
      "created_at": DateTime.now(),
    };
    update();
  }

  resetState() {
    orderDetail = null;
    orderItems.clear();
    categoryNameFilter = "All";
    update();
  }
}
