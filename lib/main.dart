import 'package:flutter/material.dart';
import 'package:shop_app/screen/category_meals_screen.dart';
import 'package:shop_app/screen/filters_screen.dart';
import 'package:shop_app/screen/meal_detail_screen.dart';
import 'package:shop_app/screen/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      routes: {
        "/": (context) => const TabsScreen(),
        "/category-meals": (context) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: ((context) => const MealDetailScreen()),
        FiltersScreen.routeName: ((context) => const FiltersScreen()),
      },
    );
  }
}
