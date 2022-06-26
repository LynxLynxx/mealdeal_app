import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  // final String categoryId;
  // final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(categoryTitle!),
      ),
    );
  }
}
