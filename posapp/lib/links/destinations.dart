import 'package:flutter/material.dart';
import 'package:travelapp/models/destinations_model.dart';
import 'package:travelapp/screens/destination_screen.dart';

class Destinations extends StatefulWidget {
  const Destinations({Key? key}) : super(key: key);

  @override
  _DestinationsState createState() => _DestinationsState();
}

class _DestinationsState extends State<Destinations>
    with SingleTickerProviderStateMixin {
  static late AnimationController animationController;
  static late Animation animationDestinations;
  static late Animation animationOpacity;
  late CurvedAnimation curve;

  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    animationController.forward();
    animationDestinations =
        Tween<double>(begin: 200, end: 0).animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    animationOpacity =
        Tween<double>(begin: 0, end: 1).animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    curve =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // color: Colors.red,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destinations.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                SizedBox(
                  width: animationDestinations.value,
                ),
                Container(
                  height: 300,
                  width: 250,
                  //color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom: 10.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: Container(
                              height: 120,
                              width: 240,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xFFACECE1),
                                        blurRadius: 20,
                                        spreadRadius: 0.5,
                                        offset: Offset(4, 5))
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 24.0),
                                    child: Text(
                                      "${destinations[index].activities.length} Activites",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24.0, top: 5, bottom: 5),
                                    child: Text(
                                      "${destinations[index].details}",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          //color: Colors.red,
                          height: 200,
                          width: 200,
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DestinationScreen(
                                                destination:
                                                    destinations[index],
                                              )));
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 20,
                                          spreadRadius: -20,
                                          offset: Offset(12, 20)),
                                    ],
                                  ),
                                  child: Hero(
                                    tag: destinations[index].img,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Opacity(
                                        opacity: animationOpacity.value,
                                        child: Image(
                                          image: AssetImage(
                                              destinations[index].img),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 8),
                                    child: Text(
                                      destinations[index].city,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          color: Color(0xFFF0ECEC),
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Icon(
                                        Icons.navigation,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                      Text(
                                        destinations[index].city,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.04,
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
