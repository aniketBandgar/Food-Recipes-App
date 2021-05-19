import 'package:delimeals/models/meal.dart';
import 'package:delimeals/screen/tabs_screen.dart';
import 'package:flutter/material.dart';
// import './screen/home_screen.dart';
import './screen/meal_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/filter_screen.dart';
import './models/dummy_data.dart';

void main() {
  runApp(Delimeal());
}

class Delimeal extends StatefulWidget {
  @override
  _DelimealState createState() => _DelimealState();
}

class _DelimealState extends State<Delimeal> {
  Map<String, bool> filters = {
    'gluteen': false,
    'lactose': false,
    'vegeterian': false,
    'vegan': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouritesMeals = [];

  void _filterSave(Map<String, bool> changedfilter) {
    setState(() {
      filters = changedfilter;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluteen'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggledFavourite(String id) {
    final index = favouritesMeals.indexWhere((element) => element.id == id);
    if (index >= 0) {
      setState(() {
        favouritesMeals.removeAt(index);
      });
    } else {
      setState(() {
        favouritesMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool isFavourite(String id) {
    return favouritesMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'delimeal',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        // canvasColor: Colors.grey,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'RaleWay',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favouritesMeals),
        MealScreen.routname: (context) => MealScreen(availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(toggledFavourite, isFavourite),
        Filters.routeName: (context) => Filters(filters, _filterSave),
      },
    );
  }
}
