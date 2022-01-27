import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/links/basketpage.dart';
import 'package:travelapp/main.dart';
import 'package:travelapp/models/appetizer_models.dart';
// import 'package:travelapp/libs/main.dart';
import 'package:travelapp/models/maincourse_model.dart';

class Appetizers extends StatefulWidget {
  Appetizers({Key? key}) : super(key: key);

  @override
  _AppetizersState createState() => _AppetizersState();
}

class _AppetizersState extends State<Appetizers>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animationhotels;
  late Animation _animationOpacity;
  final globalkey = MyApp();
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animationController.forward();
    _animationhotels =
        Tween<double>(begin: 200, end: 0).animate(_animationController)
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

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationOpacity.value,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: _animationhotels.value,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: appetizer.appetizerLists.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.blue,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            //  elevation: 20,

                            // shape: BoxShape.circle,

                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black54,
                                      offset: Offset(2, 2),
                                      spreadRadius: 1.2)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //   MyApp(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.11,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      // margin: EdgeInsets.symmetric(horizontal: 20.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                blurRadius: 20,
                                                spreadRadius: 3,
                                                offset: Offset(0, 5)),
                                          ]),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: hotels
                                                .hotelsLists[index].hotelImg,
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          )),
                                    ),
                                    //FOR ITEM
                                    Container(
                                      //color: Colors.yellow,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            hotels
                                                .hotelsLists[index].productName,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            appetizer.appetizerLists[index]
                                                .productDescription,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.034,
                                                fontWeight: FontWeight.w300,
                                                color: Color(0xFFA7A7A7)),
                                          ),
                                          /*

                                          */
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            child: Text(
                                              "\$${appetizer.appetizerLists[index].productPrice}",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.045,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                    onTap: () => {
                                          // showModalBottomSheet<void>(
                                          //   backgroundColor: Colors.transparent,
                                          //   context: context,
                                          //   builder: (BuildContext context) {
                                          //     return Container(
                                          //       height: 200,
                                          //       decoration: BoxDecoration(
                                          //         color: Colors.red,
                                          //         borderRadius:
                                          //             BorderRadius.only(
                                          //                 topLeft:
                                          //                     Radius.circular(
                                          //                         20),
                                          //                 topRight:
                                          //                     Radius.circular(
                                          //                         20)),
                                          //       ),
                                          //       child: Center(
                                          //         child: Column(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment
                                          //                   .center,
                                          //           mainAxisSize:
                                          //               MainAxisSize.min,
                                          //           children: <Widget>[
                                          //             const Text(
                                          //                 'Modal BottomSheet'),
                                          //             ElevatedButton(
                                          //               child: const Text(
                                          //                   'Close BottomSheet'),
                                          //               onPressed: () =>
                                          //                   Navigator.pop(
                                          //                       context),
                                          //             )
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     );
                                          //   },
                                          // )
                                          //globalkey.
                                       //   bottomNavbar(),
                                          print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
                                        },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20)),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    )),
                                // Text(
                                //   "0",
                                //   style: TextStyle(
                                //     fontSize: 12.0,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // InkWell(
                                //   onTap: () => {},
                                //   child: CircleAvatar(
                                //     // backgroundColor: theme.disabled,
                                //     radius: 12,
                                //     child: Icon(
                                //       CupertinoIcons.minus,
                                //       size: 12.0,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
