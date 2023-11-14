import 'package:flutter/material.dart';

class NavItem {
  final IconData icon;
  final String title;
  final Color color;

  NavItem({required this.icon, required this.title, required this.color});
}

List<NavItem> navItems = [
  NavItem(icon: Icons.home, title: "Home", color: Colors.teal),
  NavItem(icon: Icons.search, title: "Search", color: Colors.blue),
  NavItem(icon: Icons.person, title: "Profile", color: Colors.pink),
  // Add other navigation items...
];
