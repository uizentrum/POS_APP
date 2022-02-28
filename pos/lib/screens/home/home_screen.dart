import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pos/model/category_model.dart';
import 'package:pos/model/models.dart';
import 'package:pos/screens/drawer/drawer.dart';
import 'package:pos/widget/widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(
        category: category,
      ),
    );
  }

  final Category category;

  const HomeScreen({
    Key? key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade800,
        appBar: CustomAppBar(
          title: "Arriba Mexico",
        ),
        bottomNavigationBar: CustomNavBar(screen: "/"),
        drawer: Drawer(
          child: Container(
            color: Colors.blueGrey.shade800,
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.grey, Colors.blueGrey]),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: Center(
                              child: CircleAvatar(
                                radius: 40.sp,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/demo.png"),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Account",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
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
        ),
        body: Column(
          children: [
            Text(
              "Categories",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold),
            ),

            
            Expanded(
              flex: 2,
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 5,
                          viewportFraction: 0.95,
                          // enlargeStrategy: CenterPageEnlargeStrateg
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
                      SectionTile(title: "Recently added"),
                      ProductCarousel(
                          products: Product.products
                              .where(
                                (product) => product.isRecentlyadded,
                              )
                              .toList()),
                      SectionTile(title: "Drink"),
                      ProductCarousel(
                          products: Product.products
                              .where((product) => product.isDrink)
                              .toList()),
                      SectionTile(title: "Vegan-Category"),
                      ProductCarousel(
                          products: Product.products
                              .where(
                                (product) => product.isRecentlyadded,
                              )
                              .toList()),
                      SectionTile(title: "Snacks"),
                      ProductCarousel(
                        products: Product.products
                            .where((product) => product.isDrink)
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
