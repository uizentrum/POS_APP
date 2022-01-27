import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/models/tryModel.dart';


class BottomNav{
    bottomNavbar() {
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
                  badgeContent:
                      Text(countDataForSearch[0].itemCount.toString())),
              // badgeContent: Text(Provider.of<TryModel>(context, listen: true).il[0].itemCount.toString())),
              Text(
                "Basket",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              Icon(null),
            ],
          ),
          onPressed: () {
            // _navigateAndDisplaySelection(
            //     context, countDataForSearch, basketDataForSearch, tryM);
          }),
    );
  }
}
