import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile({String title,IconData icon,Function tapHandler}){
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      onTap: tapHandler
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.green,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(title: "Meals",icon: Icons.restaurant,tapHandler: (){
                Navigator.of(context).pushReplacementNamed('/');
          },),
          buildListTile(title: "Filter",icon: Icons.filter_alt_outlined,tapHandler: (){
            // Navigator.of(context).pushNamed(FilterScreen.routeName);
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          }),
          buildListTile(title: "Favorite",icon: Icons.star),

        ],
      ),
    );
  }
}
