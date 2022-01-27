import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tarka/model/category_model.dart';
import 'package:tarka/model/models.dart';
import 'package:tarka/screens/drawer/drawer.dart';
import 'package:tarka/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: CustomAppBar(
        title: "POS",
      ),
      bottomNavigationBar: CustomNavBar(screen: "/"),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.grey, Colors.blueGrey]),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "images/xtz.jpg",
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      Text(
                        "Account",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
            MyDrawerList(Icons.person, "Profiles", () {}),
            MyDrawerList(Icons.notifications, "Notifications", () {}),
            MyDrawerList(Icons.settings, "Settings", () {}),
            MyDrawerList(Icons.logout, "Logout", () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
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
                items: Category.categories
                    .map((category) => HeroCarosuel(category: category))
                    .toList(),
              ),
              SectionTile(title: "Recommended"),
              ProductCarousel(
                  products: Product.products
                      .where((product) => product.isRecommended)
                      .toList()),
              SectionTile(title: "Popular"),
              ProductCarousel(
                  products: Product.products
                      .where((product) => product.isPopular)
                      .toList()),
              SectionTile(title: "Drink Category"),
              ProductCarousel(
                  products: Product.products
                      .where(
                        (product) => product.isRecentlyadded,
                      )
                      .toList()),
              SectionTile(title: "Chicken Category"),
              ProductCarousel(
                  products: Product.products
                      .where((product) => product.isDrink)
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
