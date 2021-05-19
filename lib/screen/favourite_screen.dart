import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavoriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Center(
            child: Text(
                'there is no any favourites meals are added.go add it...!!!')),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            imageUrl: favouriteMeals[index].imageUrl,
            mealName: favouriteMeals[index].title,
            durration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            mealId: favouriteMeals[index].id,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
