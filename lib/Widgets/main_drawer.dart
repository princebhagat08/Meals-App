import 'package:flutter/material.dart';
import 'package:meal_app/Screens/category_meals_screen.dart';
import 'package:meal_app/Screens/filters_screen.dart';
import 'package:meal_app/Screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              color: Colors.amber,
              child: const Text(
                'Cooking Up!!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    fontFamily: 'Raleway'),
              ),
            ),
            SizedBox(height: 20),
             ListTile(
              onTap: (){
                Navigator.of(context).
                pushNamed(TabsScreen.screenName);
              },
              leading: Icon(Icons.restaurant, size: 24),
              title: Text(
                'Meals',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'RobotoCondensed'),
                
              ),
              
            ),
            SizedBox(
              height: 10,
            ),
             ListTile(
              leading: Icon(Icons.settings, size: 24),
              title: Text(
                'Filters',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'RobotoCondensed'),
              ),
              onTap: (){
                Navigator.of(context).pushNamed(FiltersScreen.screenName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
