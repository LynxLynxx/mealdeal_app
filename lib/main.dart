import 'package:flutter/material.dart';
import 'package:shop_app/dummy_data.dart';
import 'package:shop_app/screen/category_meals_screen.dart';
import 'package:shop_app/screen/filters_screen.dart';
import 'package:shop_app/screen/meal_detail_screen.dart';
import 'package:shop_app/screen/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };

  List<Meal> avaliableMeals = dummyMEALS;
  List<Meal> favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;

      avaliableMeals = dummyMEALS.where((element) {
        if (filters["gluten"]! && !element.isGlutenFree) {
          return false;
        }
        if (filters["lactose"]! && !element.isLactoseFree) {
          return false;
        }
        if (filters["vegan"]! && !element.isVegan) {
          return false;
        }
        if (filters["vegetarian"]! && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        favoriteMeals.indexWhere((element) => element.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(dummyMEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return favoriteMeals.any((element) => element.id == id);
  }

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
        "/": (context) => TabsScreen(favoriteMeals: favoriteMeals),
        "/category-meals": (context) =>
            CategoryMealsScreen(avaliableMeals: avaliableMeals),
        MealDetailScreen.routeName: ((context) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isMealFavorite: _isMealFavorite)),
        FiltersScreen.routeName: ((context) => FiltersScreen(
              saveFilters: _setFilters,
              currentFilters: filters,
            )),
      },
    );
  }
}
