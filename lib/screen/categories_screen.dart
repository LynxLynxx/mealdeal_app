import 'package:flutter/material.dart';
import 'package:shop_app/dummy_data.dart';
import 'package:shop_app/screen/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MealDeal"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: dummyCATEGORIES
            .map((e) => CategoryItem(
                  id: e.id,
                  title: e.title,
                  color: e.color,
                ))
            .toList(),
      ),
    );
  }
}
