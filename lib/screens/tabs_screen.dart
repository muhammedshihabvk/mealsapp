import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/custom%20widgets/mainDrawer.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {

  List<String> favorateMeals;

  TabScreen({this.favorateMeals});

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _page;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _page = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(favorateMeals: widget.favorateMeals,), 'title': 'Favorite'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_page[_selectedPageIndex]['title']),
        ),
        body: _page[_selectedPageIndex]['page'],
        drawer: MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.green,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.star),
              label: "Favorites",
            ),
          ],
        ));
  }
}

// DefaultTabController(
// length: 2,
// child: Scaffold(
// appBar: AppBar(
// title: Text("meals"),
// bottom: TabBar(
// tabs: [
// Tab(
// icon: Icon(Icons.category,color: Colors.deepPurple,),
// text: "Categories",
// ),
// Tab(
// icon: Icon(Icons.favorite,color: Colors.red,),
// text: "Categories",
// ),
// ],
// ),
// ),
// body: TabBarView(children: [
// CategoriesScreen(),
// FavoriteScreen(),
// ],),
// ));
