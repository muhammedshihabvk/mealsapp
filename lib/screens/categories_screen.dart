import 'package:flutter/material.dart';
import 'package:mealsapp/custom%20widgets/categoryItem.dart';
import 'package:mealsapp/dummyDataFile.dart';
import 'package:mealsapp/model/meal.dart';



class CategoriesScreen extends StatelessWidget {

  static const routeName = '/categoriesScreen';

  List<Meal> availableMeals;

  CategoriesScreen({this.availableMeals});

  @override
  Widget build(BuildContext context) {
    print("inside cat screen:${availableMeals}");
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      // appBar: AppBar(
      //   backgroundColor: Colors.white54,
      //   title: Text("Meals App"),
      // ),
      body: GridView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 20,
        ),
        children: [
          ...DUMMY_CATEGORY_DATA.map((catData) => CategoryItem(title: catData.title,color: catData.color,categoryId: catData.id,availableMeals: availableMeals,)).toList(),
        ],
      ),
    );
  }
}
