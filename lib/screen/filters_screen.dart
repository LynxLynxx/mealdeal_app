import 'package:flutter/material.dart';
import 'package:shop_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.currentFilters["gluten"]!;
    vegetarian = widget.currentFilters["vegetarian"]!;
    vegan = widget.currentFilters["vegan"]!;
    lactoseFree = widget.currentFilters["lactose"]!;
    super.initState();
  }

  Widget _buildSwitchListTile(
      bool value, String title, String subtitle, Function(bool) updateValue) {
    return SwitchListTile(
      value: value,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filter"),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    "gluten": glutenFree,
                    "lactose": lactoseFree,
                    "vegan": vegan,
                    "vegetarian": vegetarian
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(glutenFree, "Gluten-free",
                      "Only include gluten-free meals.", (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(lactoseFree, "Lactose-free",
                      "Only include lactose-free meals.", (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      vegan, "Vegan", "Only include vegan meals.", (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  }),
                  _buildSwitchListTile(vegetarian, "Vegetarian",
                      "Only include vegetarian meals.", (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
