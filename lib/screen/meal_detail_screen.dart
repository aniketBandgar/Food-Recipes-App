import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/Meal_Detail_Page';

  Function toggleFavourite;
  Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget buildTitleWidget(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildListwidget(Widget widget) {
    return Container(
      height: 200,
      width: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealDetail = DUMMY_MEALS.firstWhere((e) => e.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealDetail.title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealDetail.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitleWidget(context, 'ingredients'),
            buildListwidget(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${mealDetail.ingredients[index]}'),
                    ),
                  );
                },
                itemCount: mealDetail.ingredients.length,
              ),
            ),
            buildTitleWidget(context, 'Steps'),
            buildListwidget(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(mealDetail.steps[index]),
                      ),
                      Divider()
                    ],
                  );
                },
                itemCount: mealDetail.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavourite(mealId);
        },
      ),
    );
  }
}
