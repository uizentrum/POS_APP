import 'package:flutter/cupertino.dart';
import 'itemCountModel.dart';

int a = 0;
//stores items counts for search
List<ItemCountModel> countDataForSearch = [ItemCountModel(0)];
// List<BasketModel> basketDataForSearch = [];

class TryModel extends ChangeNotifier {
  // bool _isLoading = false;
  // bool get isLoading => _isLoading ;
  late List<ItemCountModel> il;

  // static List<BasketModel> basketData = [];
  //int countBadge=0;

  //Cart postData =
  // List<Cart> pstCod = [Cart(1, "10117", 20, 1)];

  late int b;
  late ItemCountModel itemContMdl;

  addItem([whichpage]) {
    // if contains data then list is not cleared..for search page
    //++countBadge;

    if (whichpage == null) {
      // _isLoading = true;

      il = countDataForSearch;

      b = ++il[0].itemCount;
      itemContMdl = ItemCountModel(b);
      il.clear();
      il.add(itemContMdl);
      countDataForSearch = il;
      // _isLoading = false;
      notifyListeners();
    }

    //  // countDataForSearch.clear();
    //  // countDataForSearch=il;
    //  // countDataForSearch.add(itemContMdl);
    //  notifyListeners();
    // }
    // else if(containsData!=null){
    //   if (il.isNotEmpty && il[0].itemCount!=0) {
    //   //  il=countDataForSearch;
    //     int b = il[0].itemCount;
    //     ItemCountModel itemContMdl = ItemCountModel(b);
    //     il.clear();
    //     il.add(itemContMdl);
    //     notifyListeners();
    //   }else{
    //     notifyListeners();
    //   }
    //   //else{
    //  //   int b=countDataForSearch[0].itemCount;
    //   //  ItemCountModel itemContMdl = ItemCountModel(b);
    //    // il.clear();
    //    // il.add(itemContMdl);
    //   //}
    // }
    else if (whichpage == "secondpage") {
      print("hello second page");
      countDataForSearch[0].itemCount++;
      il = countDataForSearch;
      notifyListeners();
    }
  }

  // addpstCode(d) {
  //   pstCod.clear();
  //   pstCod.add(d);
  //   notifyListeners();
  // }

  // addBasketData(
  //     [itemIndexCount,
  //     productName,
  //     price,
  //   //  deliveryCharge,
  //     productId,
  //     taxClass,
  //     description,
  //     choice,
  //     pageWhich]) {
  //   BasketModel basketModel;
  //   basketModel = BasketModel(itemIndexCount, productName, price, productId, taxClass, description,choice, pageWhich);

  //   basketData = basketDataForSearch;

  //   bool dataRepeat = false;

  //   for (var i = 0; i < basketData.length; i++) {
  //     if (basketData[i].productId == productId) {
  //       basketData[i].itemIndexCount = basketData[i].itemIndexCount + 1;
  //       basketData[i].price = basketData[i].price + price;
  //          //basketData[i].deliveryCharge = basketData[i].deliveryCharge + deliveryCharge;
  //       dataRepeat = true;
  //       break;
  //     }
  //   }

  //   if (dataRepeat == false) {
  //     if (pageWhich == null) {
  //       basketData.add(basketModel);
  //       basketDataForSearch = basketData;
  //       notifyListeners();
  //     } else if (pageWhich == "pageSecond") {
  //       basketDataForSearch.add(basketModel);
  //       basketData = basketDataForSearch;
  //       notifyListeners();
  //     }
  //   }
  //   notifyListeners();
  // }

  //  addBasketDatas(
  //     [itemIndexCount,
  //     productName,
  //     price,
  //   //  deliveryCharge,
  //     productId,
  //     taxClass,
  //     description,
  //     choice,
  //     pageWhich]) {
  //   BasketModel basketModel;
  //   basketModel = BasketModel(itemIndexCount, productName, price, productId, taxClass, description,choice, pageWhich);

  //   basketData = basketDataForSearch;

  //   bool dataRepeat = false;

  //   for (var i = 0; i < basketData.length; i++) {
  //     if (basketData[i].productId == productId  && basketData[i].choice == choice ) {
  //       basketData[i].itemIndexCount = basketData[i].itemIndexCount + 1;
  //       basketData[i].price = basketData[i].price + price;
  //          //basketData[i].deliveryCharge = basketData[i].deliveryCharge + deliveryCharge;
  //       dataRepeat = true;
  //       break;
  //     }
  //   }

  //   if (dataRepeat == false) {
  //     if (pageWhich == null) {
  //       basketData.add(basketModel);
  //       basketDataForSearch = basketData;
  //       notifyListeners();
  //     } else if (pageWhich == "pageSecond") {
  //       basketDataForSearch.add(basketModel);
  //       basketData = basketDataForSearch;
  //       notifyListeners();
  //     }
  //   }
  //   notifyListeners();
  // }

  // void cleanData() {
  //   countDataForSearch[0].itemCount == 0;
  //   basketData.clear();
  //   notifyListeners();
  // }
}
