import 'package:flutter/material.dart';
import 'package:mealsapp/custom%20widgets/mealItem.dart';
import 'package:mealsapp/dummyDataFile.dart';

class CategoryMealScreen extends StatefulWidget {

  static const routeName = '/categoryMealScreen';

  final String title;
  final String categoryId;
  // List<Meal> availableMeals;

  CategoryMealScreen({this.title, this.categoryId,});

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(widget.categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.title}",
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
