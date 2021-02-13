import 'package:flutter/material.dart';
import 'package:mealsapp/custom%20widgets/mealItem.dart';
import 'package:mealsapp/dummyDataFile.dart';
// import 'package:mealsapp/model/meal.dart';

class CategoryMealScreen extends StatelessWidget {
  final String title;
  final String categoryId;

  CategoryMealScreen({this.title, this.categoryId});

  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$title",
          style: TextStyle(fontFamily: 'BarlowCondensed'),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
