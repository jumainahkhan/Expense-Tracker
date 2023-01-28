import 'package:expense_tracker/Screens/HomeScreen/home_screen.dart';
import 'package:expense_tracker/Screens/ProfileScreen/profile_screen.dart';
import 'package:expense_tracker/Screens/StatisticsScreen/statistics_screen.dart';
import 'package:expense_tracker/Screens/WalletScreen/wallet_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:hexcolor/hexcolor.dart';

import 'Controller/navbar_controller.dart';

class NavBarActivity extends StatefulWidget {
  const NavBarActivity({super.key});

  @override
  State<NavBarActivity> createState() => _NavBarActivityState();
}

class _NavBarActivityState extends State<NavBarActivity> {
  NavBarController navBarController = Get.put(NavBarController());

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    StatisticsScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(navBarController.selectedIndex),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: GNav(
              selectedIndex: navBarController.selectedIndex,
              onTabChange: (index) {
                setState(() {
                  navBarController.changeIndex(index);
                });
              },

              activeColor: HexColor('#568986'),

              color: HexColor('#bebebe'),
              // activeColor: HexColor('#499FA4'),

              // gap: 2,
              padding: const EdgeInsets.all(10),
              // tabBorder: Border.symmetric(horizontal: BorderSide.merge(a, b)),
              iconSize: 27,
              tabs: const [
                GButton(
                  icon: CupertinoIcons.home,
                  // text: 'Home',
                ),
                GButton(
                  icon: CupertinoIcons.chart_bar_fill,
                  // text: 'Scan',
                ),
                GButton(
                  icon: CupertinoIcons.money_dollar,
                  // text: 'Search',
                ),
                GButton(
                  icon: CupertinoIcons.person,
                  // text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
