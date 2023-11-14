import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_bottom_navigation/navigations_bar/curved_navigation/curved_navigation_bar.dart';
import 'package:flutter_custom_bottom_navigation/navigations_bar/rounded_navigation/rounded_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;
  List<String> listItems = ['Home', 'Gallery', 'Profile'];
  List listOfIcons = [
    "assets/icons/home.png",
    "assets/icons/gallery.png",
    "assets/icons/user.png"
  ];

  setBottomBarIndex(index) {
    setState(() {
      pageIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter bottom navigation",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      bottomNavigationBar:
      RoundedBottomNavigationBar(
          onTap: (index) {
            setState(() {
              setBottomBarIndex(index);
              HapticFeedback.lightImpact();
            });
          },
          pageIdx: pageIdx,
          listItems: listItems,
          listOfIcons: listOfIcons),
    );
  }
}
