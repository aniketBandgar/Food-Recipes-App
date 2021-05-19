import 'package:delimeals/screen/filter_screen.dart';
import 'package:delimeals/screen/tabs_screen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Widget listTile(IconData icon, String title, Function stateHandler) {
    return ListTile(
      leading: CircleAvatar(child: Icon(icon)),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 26,
            fontFamily: 'Raleway'),
      ),
      onTap: stateHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up...!',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w900,
                fontSize: 26,
                color: Colors.purple,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listTile(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          listTile(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(Filters.routeName);
          })
        ],
      ),
    );
  }
}
