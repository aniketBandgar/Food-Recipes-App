import 'package:flutter/material.dart';
import '../screen/meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    @required this.id,
    @required this.title,
    @required this.color,
  });
  void categorySelected(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealScreen.routname, arguments: {
      'id': id,
      'name': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => categorySelected(context),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [color.withOpacity(0.5), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }
}
