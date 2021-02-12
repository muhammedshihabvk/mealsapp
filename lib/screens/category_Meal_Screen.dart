import 'package:flutter/material.dart';


class CategoryMealScreen extends StatelessWidget {

  String title;

  CategoryMealScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$title",style: TextStyle(fontFamily: 'BarlowCondensed'),),),
      body: Center(child: Text(title,)),
    );
  }
}
