import '../widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  static const String routeName = '/Filers_screen';
  final Function filterChange;
  final Map<String, bool> currentFilters;

  Filters(this.currentFilters, this.filterChange);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  Widget buildSwitchListTile(
      String title, String description, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    isGlutenFree = widget.currentFilters['gluteen'];
    isVegan = widget.currentFilters['vegan'];
    isVegetarian = widget.currentFilters['vegeterian'];
    isLactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> filters = {
                'gluteen': isGlutenFree,
                'lactose': isLactoseFree,
                'vegeterian': isVegetarian,
                'vegan': isVegan,
              };

              return widget.filterChange(filters);
            },
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Adjust Your MEal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile('Gluteen Free',
                  'only include gluteen-free meals', isGlutenFree, (value) {
                setState(() {
                  isGlutenFree = value;
                });
              }),
              buildSwitchListTile(
                  'vegeterian', 'only include veg meals', isVegetarian,
                  (value) {
                setState(() {
                  isVegetarian = value;
                });
              }),
              buildSwitchListTile('Lactose Free',
                  'only include lactose-free meals', isLactoseFree, (value) {
                setState(() {
                  isLactoseFree = value;
                });
              }),
              buildSwitchListTile('Vegan', 'only include vegan meals', isVegan,
                  (value) {
                setState(() {
                  isVegan = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
