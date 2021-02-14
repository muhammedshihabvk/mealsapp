import 'package:flutter/material.dart';
import 'package:mealsapp/dummyDataFile.dart';

class MealDetailScreen extends StatelessWidget {
  final String id;
  final String title;

  MealDetailScreen({this.id, this.title});

  @override
  Widget build(BuildContext context) {
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionDividerText(headingText: "Ingredients"),
            Container(
                height: 150,
                width: 400,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    border: Border.all(color: Colors.white54, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.amberAccent,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    );
                  },
                )),
            sectionDividerText(headingText: "Steps"),
            Container(
                height: 150,
                width: 400,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    border: Border.all(color: Colors.white54, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.amberAccent,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          selectedMeal.steps[index],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  Widget sectionDividerText({String headingText}) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Text(
        headingText,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
