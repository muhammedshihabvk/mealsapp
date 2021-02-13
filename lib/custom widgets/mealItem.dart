import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.title,
      @required  this.id,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
      return MealDetailScreen(title: title,id: id,);
    },));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        color: Colors.white,
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 10,
                    child: Container(
                        width: 200,
                        color: Colors.black54,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'BarlowCondensed',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )
                    )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(Icons.schedule_sharp),
                    SizedBox(width: 4,),
                    Text("$duration",style: TextStyle(fontSize: 18),),
                  ],),
                  Row(children: [
                    Icon(Icons.analytics_outlined),
                    SizedBox(width: 4,),
                    Text(complexityText)
                  ],),
                  Row(children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 4,),
                    Text(affordabilityText)
                  ],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
