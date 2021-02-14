import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filter_screen.dart';
// import 'file:///D:/FlutterUdemyProjects/mealsapp/lib/screens/categories_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => TabScreen(),
        FilterScreen.routeName : (context) => FilterScreen(),
      },
      // home: CategoriesScreen(),
    );
  }
}

