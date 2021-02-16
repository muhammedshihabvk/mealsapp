import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/category_Meal_Screen.dart';
import 'package:mealsapp/screens/filter_screen.dart';
import 'package:mealsapp/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<Meal> _availableMeals = DUMMY_MEALS;

  // Map<String, bool> _filters = {
  //   'gluten': false,
  //   'lactose': false,
  //   'vegan': false,
  //   'vegetarian': false,
  // };

  // void _setFilters(Map<String,bool> filterData) {
  //   setState(() {
  //     _filters = filterData;
  //     _availableMeals = DUMMY_MEALS
  //         .where((meal) =>
  //             meal.isGlutenFree == _filters['gluten'] &&
  //             meal.isLactoseFree == _filters['lactose'] &&
  //             meal.isVegan == _filters['vegan'] &&
  //             meal.isVegetarian == _filters['vegetarian']
  //     ).toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
      // home: CategoriesScreen(),
    );
  }
}
