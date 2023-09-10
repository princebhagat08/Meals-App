import 'package:flutter/material.dart';
import '../Widgets/main_drawer.dart';
import '../meal.dart';
import './favourite_screen.dart';
import 'Category_Screen.dart';

class TabsScreen extends StatefulWidget {
  static const screenName = './Tab-Screen';
  List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  late List<Map<String, Widget>> _pages =[
    {'page': CategoryScreen(), 'title': Text('Categories')},
    {'page': FavouriteScreen(widget.favouriteMeals), 'title': Text('Favourite')},
  ];

  int _currentPageIndex = 0;



  void _selectScreen(int Index) {
    setState(() {
      _currentPageIndex = Index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_currentPageIndex]['title'],
      ),
      drawer: MainDrawer(),

      body: _pages[_currentPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          onTap: _selectScreen,
          currentIndex: _currentPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                ),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
          ]),
    );
  }
}
