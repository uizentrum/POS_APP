import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/model/category_model.dart';
import 'package:pos/model/models.dart';
import 'package:pos/screens/drawer/drawer.dart';
import 'package:pos/screens/home/cate.dart';
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

  HomeScreen({
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
            Container(
              child: Text(
                "list of table",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              height: 700,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1.5),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    int initial = index + 1;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => cate(
                                    category: category,
                                  )),
                        );
                        Get.bottomSheet(
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blueGrey,
                            ),
                            child: Wrap(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Get.to(HeroCarosuel(category: category));
                                    Get.snackbar(
                                      "Table No:-${initial.toString()} is reserved",
                                      "explore products",
                                      backgroundColor: Colors.white,
                                      colorText: Colors.black,
                                      snackPosition: SnackPosition.TOP,
                                      duration: Duration(seconds: 4),
                                      backgroundGradient: LinearGradient(
                                          colors: [
                                            Colors.amber,
                                            Colors.redAccent
                                          ]),
                                    );
                                  },
                                  title: Text("Reserve table"),
                                  leading: Icon(
                                    Icons.check_box,
                                    color: Colors.blue,
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                                ListTile(
                                  onTap: () {},
                                  title: Text("Explore categories"),
                                  leading: Icon(
                                    Icons.check_box,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isDismissible: true,
                          backgroundColor: Colors.white,
                          enableDrag: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 2),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        margin: EdgeInsets.only(bottom: 10, right: 10, left: 5),
                        // height: 130,
                        // width: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 5.0,
                              offset: Offset(0, 5),
                            ),
                            BoxShadow(
                              color: Colors.blueGrey,
                              offset: Offset(-5, 0),
                            ),
                            BoxShadow(
                              color: Colors.blueGrey,
                              offset: Offset(5, 0),
                            ),
                          ],
                          borderRadius: BorderRadiusDirectional.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/t33.jpg"),
                          ),
                        ),
                        child: Text(
                          "No:${initial.toString()}",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    );
                  }),
            ),
            // Container(
            //   child: CarouselSlider(
            //     options: CarouselOptions(
            //       scrollDirection: Axis.vertical,
            //       aspectRatio: 6,
            //       viewportFraction: 1,
            //     ),
            //     items: Category.categories
            //         .map((category) => HeroCarosuel(category: category))
            //         .toList(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
