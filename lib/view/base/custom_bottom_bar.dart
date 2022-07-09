import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  final int index;

  const CustomBottomBar({Key? key, required this.index}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // This is all you need!
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined), label: "Label 2"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows_rounded), label: "Tracking")
        ]);
  }
}
