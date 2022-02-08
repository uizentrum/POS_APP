import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_bloc.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_state.dart';
import 'package:tarka/model/cart_model.dart';
import 'package:tarka/model/product_model.dart';
import 'package:tarka/screens/print/print.dart';
import 'package:tarka/widget/cart_productcard.dart';
import 'package:tarka/widget/custom_appbar.dart';
import 'package:tarka/widget/custom_navbar.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = "/checkout";
  final List<Product> product = [];

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade800,
        appBar: CustomAppBar(title: "Checkout"),
        bottomNavigationBar: CustomNavBar(screen: routeName),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Divider(
                          thickness: 2,
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: 480,
                            child: ListView.builder(
                                itemCount: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .length,
                                itemBuilder: (context, index) {
                                  return CartProductCard(
                                    product: state.cart
                                        .productQuantity(state.cart.products)
                                        .keys
                                        .elementAt(index),
                                    quantity: state.cart
                                        .productQuantity(state.cart.products)
                                        .values
                                        .elementAt(index),
                                  );
                                }),
                          ),
                        ),
                        // Divider(
                        //   thickness: 2,
                        // ),
                      ],
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.blueGrey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Wrap(
                            children: <Widget>[
                              SizedBox(width: 20),
                              Text(
                                'Total :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${state.cart.totolString}€",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: FlatButton(
                              color: Colors.green,
                              textColor: Colors.white,
                              child: Text('Confirm Order'),
                              onPressed: () {
                                // print(product.toList());
                                // CircularProgressIndicator();
                                // Navigator.pushNamed(context, "/");
                                print(state.cart.products);
                                // final snackBar = SnackBar(
                                //   backgroundColor: Colors.amber,
                                //   content: Text(
                                //     "Your Order Confirmed",
                                //     style: TextStyle(color: Colors.black),
                                //   ),
                                // );
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(snackBar);
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (_) => Print()));
                              },
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Text("Somethimh went Wrong");
            }
          },
        ));
  }
}
