import 'package:flutter/material.dart';
import 'package:travelapp/links/appbar.dart';
import 'package:travelapp/links/colors.dart';
import 'package:travelapp/models/destinations_model.dart';

class DestinationScreen extends StatefulWidget {
  late final Destination destination;
  DestinationScreen({
    required this.destination,
  });

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animationContainer;
  late Animation _animationOpacity;

  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animationController.forward();

    _animationContainer =
        Tween<double>(begin: 100, end: 0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });

    _animationOpacity =
        Tween<double>(begin: 0, end: 1).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  Text _buildRatingStars(int rating) {
    String stars = "";
    for (int i = 0; i < rating; i++) {
      stars += "⭐";
    }
    return Text(
      stars,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.symmetric(vertical: 50.0),
        color: MyColors.homeContainer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.destination.img,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.amber,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                        child: Image.asset(
                          widget.destination.img,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                MyAppBAr(),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.92,
                    //color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Opacity(
                              opacity: _animationOpacity.value,
                              child: Text(
                                widget.destination.city,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.07,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Opacity(
                              opacity: _animationOpacity.value,
                              child: Row(
                                children: [
                                  Positioned(
                                    left: 2.0,
                                    child: Icon(
                                      Icons.navigation,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    widget.destination.name,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.width * 0.1,
                            //color: Colors.amber,
                            child: Center(
                              child: Opacity(
                                opacity: _animationOpacity.value,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 10.0,
                                      child: Icon(
                                        Icons.location_on,
                                        size: 32,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Positioned(
                                      left: 2.0,
                                      child: Icon(
                                        Icons.location_on,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _animationContainer.value,
            ),
            Expanded(
              child: Opacity(
                opacity: _animationOpacity.value,
                child: Container(
                  width: double.infinity,
                  //color: Colors.blue,
                  //alignment: Alignment.topCenter,
                  child: ListView.builder(
                      itemCount: widget.destination.activities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  height: 165,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFFACECE1),
                                            blurRadius: 20,
                                            spreadRadius: 5,
                                            offset: Offset(4, 5))
                                      ]),
                                ),
                              ),
                              Container(
                                height: 155,
                                //  width: 200,
                                //color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                        image: AssetImage(
                                      activities[index].imgUrl,
                                    )),
                                  ),
                                ),
                              ),
                              Container(
                                height: 165,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20.0, top: 10),
                                        child: Text(
                                          activities[index].price,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.038,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Text(
                                          activities[index].priceType,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: MediaQuery.of(context).size.width * 0.38,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  // color: Colors.red,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        activities[index].name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        activities[index].type,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.039,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        _buildRatingStars(
                                                activities[index].rating)
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        width: double.infinity,
                                        //  color: Colors.blue,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.16,
                                                color: MyColors.timeRange,
                                                child: Center(
                                                  child: Text(
                                                    activities[index]
                                                        .startTime[0],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.029,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.16,
                                                color: MyColors.timeRange,
                                                child: Center(
                                                  child: Text(
                                                    activities[index]
                                                        .startTime[1],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.029,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
