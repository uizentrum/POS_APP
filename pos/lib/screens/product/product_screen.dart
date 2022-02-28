import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/blocks/wishlist/cartbloc/cart_bloc.dart';
import 'package:pos/blocks/wishlist/cartbloc/cart_event.dart';
import 'package:pos/blocks/wishlist/cartbloc/cart_state.dart';
import 'package:pos/blocks/wishlist/wishlist_block.dart';
import 'package:pos/blocks/wishlist/wishlist_event.dart';
import 'package:pos/blocks/wishlist/wishlist_state.dart';
import 'package:pos/model/models.dart';
import 'package:pos/widget/widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  static const String? routeName = "/product";

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(
        product: product,
      ),
    );
  }

  final Product product;
  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: CustomAppBar(title: product.name),
      body: Expanded(
        child: ListView(
          children: [
            Card(
              color: Colors.blueGrey.shade100,
            ),
            // CarouselSlider(
            //   options: CarouselOptions(
            //     aspectRatio: 0.5,
            //     viewportFraction: 5,
            //   ),
            //   items: [
            //     HeroCarosuel(
            //       product: product,
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Positioned(
                    left: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      alignment: Alignment.bottomCenter,
                      color: Colors.black.withAlpha(150),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width - 15,
                      height: 45,
                      color: Colors.black.withAlpha(100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${product.price}€',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ExpansionTile(
                backgroundColor: Colors.grey.shade100,
                initiallyExpanded: true,
                title: Text(
                  "Delecious food",
                  style: Theme.of(context).textTheme.headline6,
                ),
                children: [
                  Title(
                    color: Colors.grey,
                    child: Text(
                      "welcome to deleciou food category",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff134b5f),
        child: Container(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context
                        .read<WishlistBloc>()
                        .add(AddWishlistProduct(product));
                    final snackBar = SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.black,
                      content: Text("Added to Favourite"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.amber,
                  ),
                );
              }),
              Padding(
                padding: EdgeInsets.all(8.w),
                child:
                    BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      // shape:BoxShape.rectangle
                    ),
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                      Navigator.pushNamed(context, "/cart");
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
