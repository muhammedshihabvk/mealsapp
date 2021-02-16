import 'package:flutter/material.dart';
import 'package:mealsapp/custom%20widgets/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filterScreen';


  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget filterRule(
      {String titleText,
      String descriptionSubtitle,
      Function updateValue,
      bool currentValue}) {
    return SwitchListTile(
      title: Text(titleText),
      subtitle: Text(descriptionSubtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters")),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              filterRule(
                  titleText: "Gluten free",
                  descriptionSubtitle: "Only include gluten-free meals",
                  currentValue: _glutenFree,
                  updateValue: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              filterRule(
                  titleText: "Lactose free",
                  descriptionSubtitle: "Only include lactose-free meals",
                  currentValue: _lactoseFree,
                  updateValue: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
              filterRule(
                  titleText: "Vegetarian",
                  descriptionSubtitle: "Only include vegetarian meals",
                  currentValue: _vegetarian,
                  updateValue: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              filterRule(
                  titleText: "Vegan",
                  descriptionSubtitle: "Only include vegan meals",
                  currentValue: _vegan,
                  updateValue: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
