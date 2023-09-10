import 'package:flutter/material.dart';
import '../Widgets/meal_items.dart';

import '../meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const screenName = './Category_meal';


  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String title;
  late List<Meal> categoryMeals;







  @override
  Widget build(BuildContext context) {
    final ArgumentData =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    title = ArgumentData['title']!;
    final id = ArgumentData['id'];
    categoryMeals = widget.availableMeal.where(
          (element) {
        return element.categories.contains(id);
      },
    ).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItems(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,

            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
