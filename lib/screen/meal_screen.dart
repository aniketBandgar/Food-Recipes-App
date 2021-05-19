import 'package:delimeals/models/meal.dart';
import 'package:flutter/material.dart';
import '../widget/meal_item.dart';

class MealScreen extends StatefulWidget {
  static const routname = '/meal_screen';

  final List<Meal> avialableMeal;

  MealScreen(this.avialableMeal);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  String categoryName;
  String id;
  List<Meal> categoriWiseList;
  var isDataChanged = false;

  @override
  void didChangeDependencies() {
    if (!isDataChanged) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryName = args['name'];
      id = args['id'];
      categoriWiseList = widget.avialableMeal.where((e) {
        return e.categories.contains(id);
      }).toList();

      isDataChanged = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      categoriWiseList.removeWhere((e) => e.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            imageUrl: categoriWiseList[index].imageUrl,
            mealName: categoriWiseList[index].title,
            durration: categoriWiseList[index].duration,
            complexity: categoriWiseList[index].complexity,
            affordability: categoriWiseList[index].affordability,
            mealId: categoriWiseList[index].id,
          );
        },
        itemCount: categoriWiseList.length,
      ),
    );
  }
}
