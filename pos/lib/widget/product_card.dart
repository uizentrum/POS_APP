import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/blocks/wishlist/cartbloc/cart_bloc.dart';
import 'package:pos/blocks/wishlist/cartbloc/cart_event.dart';
import 'package:pos/blocks/wishlist/cartbloc/cart_state.dart';
import 'package:pos/model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProducutCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProducutCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.0,
    this.leftPosition = 10,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   "/product",
        //   arguments: product,
        // );
      },
      child: Stack(
        children: [
          // Container(
          //   width: MediaQuery.of(context).size.width / widthFactor,
          //   height: 60,
          //   // child: ClipRRect(
          //   //   borderRadius: BorderRadius.circular(5),
          //   //   child: Image.asset(
          //   //     product.imageUrl,
          //   //     fit: BoxFit.cover,
          //   //   ),
          //   // ),
          // )
          Positioned(
            child: Container(
              width: widthValue - 5.w - leftPosition,
              height: 54.h,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: widthValue - 10.w - leftPosition,
              height: 50.h,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(120),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(bottom: 0, top: 5.h, left: 5.w, right: 5.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '${product.price}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                      if (state is CartLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CartLoaded) {
                        return Expanded(
                          child: IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartProductAdded(product));
                                final snackBar = SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.amber,
                                  content: Text(
                                    "Product Added",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                              )),
                        );
                      } else {
                        return Text("Something Went Wrong");
                      }
                    }),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductRemoved(product));
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
