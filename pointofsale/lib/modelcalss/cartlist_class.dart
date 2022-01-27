import 'package:flutter/material.dart';

class cartlist {
 late int id;
 late String name;
 late String category;
 late String price;

  cartlist({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    
  });
  cartlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String,dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['price'] = this.price;
    return data;
  }
}