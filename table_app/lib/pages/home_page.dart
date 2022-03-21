import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [],
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 100.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 400,
              child: ListView.builder(itemBuilder: (c, i) {
                return Container(
                  // margin: EdgeInsets.only(bottom: 8),
                  color: Colors.grey,
                  height: 400,
                  child: GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 10,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.5),
                      // controller: pageController,

                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        int initial = index + 1;
                        return InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey,
                                ),
                                child: Wrap(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        // Get.toNamed(
                                        //   RouteHelper.getPopularFood(
                                        //       index, "home"),
                                        // );
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
                                      color: Colors.blueGrey,
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
                                    color: Colors.blueGrey,
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
                            margin:
                                EdgeInsets.only(bottom: 10, right: 10, left: 5),
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
                              // gradient: LinearGradient(
                              //   colors: [
                              //     Colors.teal,
                              //     Colors.redAccent,
                              //     Colors.amberAccent,
                              //   ],
                              //   begin: Alignment.bottomCenter,
                              //   end: Alignment.topCenter,
                              // ),

                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/xtz.jpg"),
                              ),
                            ),
                            child: Text(
                              "No:-${initial.toString()}",
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

                  // child: PageView.builder(
                  //     controller: pageController,
                  //     itemCount: popularProducts.popularProductList.length,
                  //     itemBuilder: (context, positiion) {

                  //       return _buildPageItem(positiion,
                  //           popularProducts.popularProductList[positiion]);
                  //     }),
                );
              }),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 80.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount:100,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('pinned'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _pinned = val;
                      });
                    },
                    value: _pinned,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('snap'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _snap = val;
                        // Snapping only applies when the app bar is floating.
                        _floating = _floating || _snap;
                      });
                    },
                    value: _snap,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('floating'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _floating = val;
                        _snap = _snap && _floating;
                      });
                    },
                    value: _floating,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
