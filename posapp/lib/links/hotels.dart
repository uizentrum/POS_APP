import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/links/basketPage.dart';
import 'package:travelapp/links/basketpage.dart';
import 'package:travelapp/models/destinations_model.dart';
import 'package:travelapp/models/maincourse_model.dart';
import 'package:travelapp/models/tryModel.dart';
// import 'package:travelapp/total/total.dart';

import 'bottomNav.dart';

class Myhotels extends StatefulWidget {
  const Myhotels({Key? key}) : super(key: key);

  @override
  _MyhotelsState createState() => _MyhotelsState();
}

class _MyhotelsState extends State<Myhotels>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animationhotels;
  late Animation _animationOpacity;

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
                itemCount: hotels.hotelsLists.length,
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
                          child: GestureDetector(
                            onTap: () {
                            //  bottomNavbar();
                            },
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
                                                BorderRadius.circular(8),
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
                                              hotels.hotelsLists[index]
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
                                                "\$${hotels.hotelsLists[index].productPrice}",
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
                                      )
                                      ),
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

 bottomNavBar([context, tryM]) {
  //print(tryM.il[0].itemCount.toString());
  //if(countDataForSearch.isEmpty && basketDataForSearch.isEmpty){
  // if (tryM.il[0].itemCount == 0) {
  // return Container(
  //   height: 0,
  // );
  //}else{
  //  tryModel = tryM;
  return ButtonTheme(
    buttonColor: Colors.orangeAccent[700],
    height: 50.0,
    minWidth: double.infinity,
    child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Badge(
                badgeColor: Colors.white,
                toAnimate: true,
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                badgeContent: Text(countDataForSearch[0].itemCount.toString())),
            // badgeContent: Text(Provider.of<TryModel>(context, listen: true).il[0].itemCount.toString())),
            Text(
              "total",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Icon(null),
          ],
        ),
        onPressed: () {
          // _navigateAndDisplaySelection(
          //     context, countDataForSearch, basketDataForSearch, tryM);
        }),
  );
}
    }
