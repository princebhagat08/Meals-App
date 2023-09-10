import 'package:flutter/material.dart';
import '../data_list.dart';

class MealDetailScreen extends StatefulWidget {
  static const screenName = './meal_detail';
  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  var mealDetails;
  var mealId;


  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    final mealDetails = DUMMY_MEALS.firstWhere((element) {
      return element.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealDetails.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(mealDetails.imageUrl),
            const SizedBox(
              height: 25,
            ),
           const  Text(
              'Ingredients',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin:const  EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.orangeAccent.withOpacity(0.5),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Container(
                        child: Text(
                          mealDetails.ingredients[index],
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                   const  Divider(
                      height: 5,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                ),
                itemCount: mealDetails.ingredients.length,
              ),
            ),
           const  SizedBox(
              height: 25,
            ),
           const Text(
              'Steps',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.orangeAccent.withOpacity(0.5),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(mealDetails.steps[index]),
                    ),
                   const  Divider(
                      height: 5,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                ),
                itemCount: mealDetails.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(widget.isFavourite(mealId) ?
        Icons.star : Icons.star_border_outlined),

        onPressed: () => widget.toggleFavourite(mealId),
      ),
    );
  }
}
