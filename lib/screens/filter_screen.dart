import 'package:flutter/material.dart';
import 'package:mealsapp/custom%20widgets/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filterScreen';

  final Function saveFilters;
  Map<String, bool> filtersValue;

  FilterScreen({this.saveFilters,this.filtersValue});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {



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

  bool _glutenFree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lactoseFree=false;

  @override
  void didChangeDependencies() {
    print("did change dep");
    setState(() {
      _glutenFree = widget.filtersValue['gluten'];
       _vegetarian = widget.filtersValue['vegetarian'];
      _vegan =widget.filtersValue['vegan'];
      _lactoseFree = widget.filtersValue['lactose'];
    });

    print(widget.filtersValue['gluten']);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
  print("filter building");
  print(_glutenFree);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: () {
          Map<String, bool> _filters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
          };
          widget.saveFilters(_filters);
          Navigator.of(context).pushReplacementNamed('/');

        },)]
      ),
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
