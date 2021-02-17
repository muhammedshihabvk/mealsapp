import 'package:flutter/material.dart';
import 'package:mealsapp/dummyDataFile.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/screens/meal_detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  List<String> favorateMeals;
  List<Meal> favList;

  FavoriteScreen({this.favorateMeals});

  @override
  Widget build(BuildContext context) {
    print(favorateMeals);
    favList =
        DUMMY_MEALS.where((meal) => favorateMeals.contains(meal.id)).toList();

    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          // ...favList
          //     .map((favMeal) => MealItem(
          //         title: favMeal.title,
          //         id: favMeal.id,
          //         imageUrl: favMeal.imageUrl,
          //         duration: favMeal.duration,
          //         complexity: favMeal.complexity,
          //         affordability: favMeal.affordability))
          //     .toList()
          ...favList
              .map((meal) => ListTile(

                    contentPadding: EdgeInsets.all(5),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return MealDetailScreen(title: meal.title,id: meal.id,);
                      },));
                    },
                    leading: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(meal.imageUrl),
                      ),
                      radius: 40,
                    ),
            title: Text(meal.title),
            subtitle:Text(meal.duration.toString()+"min"),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
