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
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                            height: 430.h,
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
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5.r)),
                      height: 60.h,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Wrap(
                            children: <Widget>[
                              SizedBox(width: 20.w),
                              Text(
                                'Total :',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Text(
                                "${state.cart.totolString}€",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: FlatButton(
                              color: Colors.green,
                              textColor: Colors.white,
                              child: Text('Print'),
                              onPressed: () {
                                // print(state);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute<CartState>(
                                        builder: (_) => Print(
                                              product: state.cart.products.last,
                                              // .productQuantity(state.cart.products)
                                              // .keys
                                              // .elementAt(index),

                                              quantity:
                                                  state.cart.products.length,
                                            )));
                              },
                            ),
                          ),
                          SizedBox(width: 20.w),
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
