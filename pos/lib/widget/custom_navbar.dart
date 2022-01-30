import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_bloc.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_event.dart';
import 'package:tarka/blocks/wishlist/cartbloc/cart_state.dart';
import 'package:tarka/blocks/wishlist/wishlist_block.dart';
import 'package:tarka/blocks/wishlist/wishlist_event.dart';
import 'package:tarka/blocks/wishlist/wishlist_state.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final String? product;

  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xff134b5f),
      child: Container(
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case "/":
        return _buildNavBar(context);
      case "/catalog":
        return _buildNavBar(context);
      case "/wishlist":
        return _buildNavBar(context);
      case "/product":
        return _buildAddToCartNavBar(context, product);
      case "/cart":
        return _buildGoToCheckoutNavBar(context);
      case "/checkout":
        return _buildOrderNowNavBar(context);
      case "/Profiles":
        return _buildNavBar(context);

      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/wishlist");
        },
        icon: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoadwd) {
            return IconButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text("Added to ur wishlist"),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  context.read<WishlistBloc>().add(AddWishlistProduct(product));
                  Navigator.pushNamed(context, "/wishlist");
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.amber,
                ));
          }
          return Text("Something went wrong");
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(
                      CartProductAdded(product),
                    );
                Navigator.pushNamed(context, "/cart");
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                "Add to Cart",
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }
          return Text("Something went wrong");
        },
      )
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/checkout");
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          "Go To Checkout",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          "",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    ];
  }
}
