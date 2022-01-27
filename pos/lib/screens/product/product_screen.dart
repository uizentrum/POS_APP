import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_bloc.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_event.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_state.dart';
import 'package:tarka/blocks/wishlist/wishlist_block.dart';
import 'package:tarka/blocks/wishlist/wishlist_event.dart';
import 'package:tarka/blocks/wishlist/wishlist_state.dart';
import 'package:tarka/model/models.dart';
import 'package:tarka/widget/widget.dart';

class ProductScreen extends StatelessWidget {
  static const String? routeName = "/product";

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product: product,),
    );
  }

  final Product product;
  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff134b5f),
        child: Container(
          height: 60,
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
                    color: Colors.black,
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                        fontSize: 16,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      body: Expanded(
        child: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: [
                HeroCarosuel(
                  product: product,
                ),
              ],
            ),
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
                      width: MediaQuery.of(context).size.width - 10,
                      height: 45,
                      color: Colors.black.withAlpha(100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${product.price}',
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
    );
  }
}
