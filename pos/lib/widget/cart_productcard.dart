import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_bloc.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_event.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_state.dart';
import 'package:tarka/model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("${quantity}" + "FSGRGERFGEFJOIJAQIOJFQJEFRE");
    return Padding(
      padding: EdgeInsets.only(bottom: 8.w),
      child: Card(
        shadowColor: Colors.black,
        elevation: 5,
        color: Colors.blueGrey,
        child: Row(
          children: [
            // Image.asset(
            //   product.imaUrl,
            //   width: 100,
            //   height: 80,
            //   fit: BoxFit.cover,
            // ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${product.price}€",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: 10.w,
            // ),
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductRemoved(product));
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "$quantity",
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
