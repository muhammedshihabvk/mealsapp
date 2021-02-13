import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("meals"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category,color: Colors.deepPurple,),
                  text: "Categories",
                ),
                Tab(
                  icon: Icon(Icons.favorite,color: Colors.red,),
                  text: "Categories",
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],),
        ));
  }
}
