import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:pointofsale/cart_provider.dart';
import 'package:pointofsale/home.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';



class BottomNavBarFb3 extends StatelessWidget {
  const BottomNavBarFb3({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.teal,
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomAppBar(
                child:IconButton(onPressed: (){
                 Navigator.push(context,
                          MaterialPageRoute(builder: (_) =>Home()));
                }, icon:Icon(Icons.print),),
              )
             
              
            ],
          ),
        ),
      ),
    );
  }
}

