import 'package:delimeals/screen/favourite_screen.dart';
import 'package:delimeals/screen/home_screen.dart';
import 'package:delimeals/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouritesMeals;

  TabsScreen(this.favouritesMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedIndex = 0;

  void selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'screen': HomeScreen(),
        'title': 'Delimeal',
      },
      {
        'screen': FavoriteScreen(widget.favouritesMeals),
        'title': 'Favourites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: DrawerWidget(),
      body: _pages[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedTab,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('favourites'),
          ),
        ],
      ),
    );
  }
}
