import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/blocks/wishlist/cartbloc/cart_bloc.dart';
import 'package:pos/blocks/wishlist/cartbloc/cart_event.dart';
import 'package:pos/blocks/wishlist/cartbloc/cart_state.dart';
import 'package:pos/blocks/wishlist/wishlist_block.dart';
import 'package:pos/blocks/wishlist/wishlist_event.dart';
import 'package:pos/blocks/wishlist/wishlist_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      elevation: 8,
      color: Color(0xff134b5f),
      child: Container(
        height: 55.h,
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
      case "/print":
        return _buildPrintNavBar(context);

      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () => {
                  Navigator.pushNamed(context, "/"),
                },
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: Colors.amber,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () => {
                  Navigator.pushNamed(context, "/cart"),
                },
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.amber,
                    ),
                    Text(
                      "Cart",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () => {
                  Navigator.pushNamed(context, "/wishlist"),
                },
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.amber,
                    ),
                    Text(
                      "favorite",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
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
          elevation: 8,
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
        onPressed: () {
          Navigator.pushNamed(context, "/");
        },
        style: ElevatedButton.styleFrom(
          elevation: 8,
          primary: Colors.blueGrey,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          "Go Back!",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    ];
  }

  List<Widget> _buildPrintNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, "/checkout");
        },
        style: ElevatedButton.styleFrom(
          elevation: 8,
          primary: Colors.blueGrey,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          "Go Back!",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    ];
  }
}
