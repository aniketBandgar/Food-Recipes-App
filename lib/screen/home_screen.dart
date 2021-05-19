import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widget/category_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: dummyCategoryData.map((e) {
        return CategoryItem(
          id: e.id,
          title: e.title,
          color: e.color,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
