import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pos_app/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainNavigationView extends StatefulWidget {
  @override
  _MainNavigationViewState createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(MainNavigationController());
  TabController tabController;
  int _index;

  getPage() {
    switch (_index) {
      case 0:
        return OrderView();
        break;
      case 1:
        return PosView();
        break;
      case 2:
        return ProfileView();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
      length: 3,
      vsync: this,
    );
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(
      builder: (_) {
        return Scaffold(
          body: getPage(),
          bottomNavigationBar: Container(
            height: 84,
            child: Column(
              children: [
                Container(
                  height: 2.0,
                  color: theme.primary.withOpacity(0.8),
                ),
                Container(
                  height: 4.0,
                  color: theme.primary.withOpacity(0.8),
                ),
                BottomNavigationBar(
                    showUnselectedLabels: true,
                    currentIndex: _index,
                    type: BottomNavigationBarType.fixed,
                    onTap: (int _index) {
                      setState(() {
                        this._index = _index;
                      });
                    },
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: CircleAvatar(
                          backgroundColor:
                              _index == 0 ? Colors.white : theme.primary,
                          child: Icon(
                            Icons.history,
                            color: _index == 0 ? theme.primary : Colors.white,
                          ),
                          radius: _index == 0 ? 22 : 16.0,
                        ),
                        label: "Your Order",
                      ),
                      BottomNavigationBarItem(
                        icon: CircleAvatar(
                          backgroundColor:
                              _index == 1 ? Colors.white : theme.primary,
                          child: Icon(
                            FontAwesomeIcons.cashRegister,
                            color: _index == 1 ? theme.primary : Colors.white,
                          ),
                          radius: _index == 1 ? 22 : 16.0,
                        ),
                        label: "POS",
                      ),
                      BottomNavigationBarItem(
                        icon: CircleAvatar(
                          backgroundColor:
                              _index == 2 ? Colors.white : theme.primary,
                          child: Icon(
                            Icons.people,
                            color: _index == 2 ? theme.primary : Colors.white,
                          ),
                          radius: _index == 2 ? 22 : 16.0,
                        ),
                        label: "Profile",
                      ),
                    ]),
              ],
            ),
          ),
        );
      },
    );
  }
}
