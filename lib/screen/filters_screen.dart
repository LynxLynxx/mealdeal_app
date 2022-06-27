import 'package:flutter/material.dart';
import 'package:shop_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = "/filters";
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dfsdf")),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text("filters"),
      ),
    );
  }
}
