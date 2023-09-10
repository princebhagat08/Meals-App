import 'package:flutter/material.dart';
import 'package:meal_app/Screens/Category_Screen.dart';
import 'package:meal_app/Screens/tabs_screen.dart';
import 'package:meal_app/Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenName = './filter-screen';

  final Function appliedFilters;
  Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.appliedFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters'), actions: [
        IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.appliedFilters(selectedFilters);
              Navigator.of(context).pushNamed(TabsScreen.screenName);
            },
            icon: Icon(Icons.check))
      ]),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Adjust Your Meal Selection',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: _glutenFree,
                title: Text('Gluten-Free'),
                subtitle: Text('Only include gluten-free meal'),
                onChanged: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                value: _lactoseFree,
                title: Text('Lactose-Free'),
                subtitle: Text('Only include lactose-free meal'),
                onChanged: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                value: _vegan,
                title: Text('Vegan'),
                subtitle: Text('Only include vegan meal'),
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              SwitchListTile(
                value: _vegetarian,
                title: Text('Vegetarian'),
                subtitle: Text('Only include vegetarian meal'),
                onChanged: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
