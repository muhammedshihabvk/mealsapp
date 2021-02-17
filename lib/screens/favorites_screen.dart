import 'package:flutter/material.dart';
import 'package:mealsapp/custom%20widgets/mealItem.dart';
import 'package:mealsapp/dummyDataFile.dart';
import 'package:mealsapp/model/meal.dart';

class FavoriteScreen extends StatelessWidget {

  List<String> favorateMeals;
  List<Meal> favList;

  FavoriteScreen({this.favorateMeals});

  @override
  Widget build(BuildContext context) {
    print(favorateMeals);
    favList =DUMMY_MEALS.where((meal) => favorateMeals.contains(meal.id)).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          ...favList.map((favMeal) => MealItem(title: favMeal.title, id: favMeal.id, imageUrl: favMeal.imageUrl, duration: favMeal.duration, complexity: favMeal.complexity, affordability: favMeal.affordability)).toList()
        ],
      ),
    );
  }
}
