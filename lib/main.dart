import 'package:flutter/material.dart';
import 'package:store_app/screens/add_screen.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/main_screen.dart';
import 'package:store_app/screens/update_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.homeScreenId: (context) => HomeScreen(),
        UpdateProductPage.updateScreenId: (context) => UpdateProductPage(),
        MainScreen.mainScreenId: (context) => MainScreen(),
        AddProductScreen.addScreenId: (context) => AddProductScreen()
      },


      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MainScreen(),
    );
  }
}
