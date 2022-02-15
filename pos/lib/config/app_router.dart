import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarka/model/category_model.dart';
import 'package:tarka/model/product_model.dart';
import 'package:tarka/screens/home/home_screen.dart';
import 'package:tarka/screens/screens.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print("Route is: ${settings.name}");

    switch (settings.name) {
      case "/":
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishListScreen.routeName:
        return WishListScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case Profiles.routeName:
        return Profiles.route();
      case Print.routeName:
        return Print.route(product: settings.arguments as Product);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: "/error"),
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Something went wrong!!!"),
        ),
      ),
    );
  }
}
