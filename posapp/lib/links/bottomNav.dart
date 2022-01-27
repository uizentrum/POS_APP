import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
class BottomNav{
bottomNavBar() {
  //print(tryM.il[0].itemCount.toString());
  //if(countDataForSearch.isEmpty && basketDataForSearch.isEmpty){
  // if (tryM.il[0].itemCount == 0) {
  // return Container(
  //   height: 0,
  // );
  //}else{
  //  tryModel = tryM;
  return ButtonTheme(
    buttonColor: Colors.orangeAccent[700],
    height: 50.0,
    minWidth: double.infinity,
    child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Badge(
                badgeColor: Colors.white,
                toAnimate: true,
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                badgeContent: Text("1")),
            // badgeContent: Text(Provider.of<TryModel>(context, listen: true).il[0].itemCount.toString())),
            Text(
              "Cart",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Icon(null),
          ],
        ),
        onPressed: () {
          // _navigateAndDisplaySelection(
          //     context, countDataForSearch, basketDataForSearch, tryM);
        }
        ),
  );
}
}