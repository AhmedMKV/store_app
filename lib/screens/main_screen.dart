import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/screens/electronics_screen.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/jewelery_screen.dart';
import 'package:store_app/screens/men_clothing.dart';
import 'package:store_app/screens/women_clothing.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static String mainScreenId = 'mainScreenPage';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    ElectronicsScreen(),
    JeweleryScreen(),
    MenClothing(),
    WomenClothing()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.electric_bolt), label: 'Electronics'),
          BottomNavigationBarItem(icon: Icon(Icons.diamond), label: 'Jewelry'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shirt), label: "Men's clothing"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.shirt), label: "Women's clothing"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
