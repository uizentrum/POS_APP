import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tarka/model/category_model.dart';
import 'package:tarka/model/models.dart';
import 'package:tarka/screens/drawer/drawer.dart';
import 'package:tarka/widget/widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    print("phone height.........." +
        MediaQuery.of(context).size.height.toString());
    print("phone width..........." +
        MediaQuery.of(context).size.width.toString());
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      appBar: CustomAppBar(
        title: "POS",
      ),
      bottomNavigationBar: CustomNavBar(screen: "/"),
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey.shade800,
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
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Image.asset(
                              "images/xtz.jpg",
                              width: 80.w,
                              height: 80.h,
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                SectionTile(title: "Vorspeisen"),
                ProductCarousel(
                    products: Product.products
                        .where((product) => product.isRecommended)
                        .toList()),
                SectionTile(title: "Suppen & Salate"),
                ProductCarousel(
                    products: Product.products
                        .where((product) => product.isPopular)
                        .toList()),
                SectionTile(title: "Beilagen & Saucen"),
                ProductCarousel(
                    products: Product.products
                        .where(
                          (product) => product.isRecentlyadded,
                        )
                        .toList()),
                SectionTile(title: "Drink & Long Drink"),
                ProductCarousel(
                    products: Product.products
                        .where((product) => product.isDrink)
                        .toList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
