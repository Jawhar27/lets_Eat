import 'package:flutter/material.dart';
import 'package:lets_eat/screens/mainDrawyer_screen.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentfilters;
  FilterScreen(this.saveFilters, this.currentfilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;

  var vegan = false;
  var vegetarian = false;
  var lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.currentfilters['Gluten-free'];
    lactoseFree = widget.currentfilters['Lactose-free'];
    vegan = widget.currentfilters['Vegan'];
    vegetarian = widget.currentfilters['Vegetarian'];

    super.initState();
  }

  Widget buildSwitchTextTile(
      String title, String subtitle, bool val, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: val,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Filters')),
        ),
        drawer: MainDrawyer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Adjust the Meals',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchTextTile(
                      'Gluten-free',
                      'Only include Gluten-Free meals.',
                      glutenFree, (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  }),
                  buildSwitchTextTile(
                      'Lactose-free',
                      'Only include lactose-Free meals.',
                      lactoseFree, (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  }),
                  buildSwitchTextTile(
                      'Vegan', 'Only include Vegan meals.', vegan, (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  }),
                  buildSwitchTextTile('Vegetarian',
                      'Only include vegetarian meals.', vegetarian, (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  }),
                  SizedBox(
                    height: 15,
                    width: 0,
                  ),
                  FloatingActionButton(
                      child: Icon(
                        Icons.save,
                        size: 25,
                      ),
                      onPressed: () {
                        Map<String, bool> selectedfilters = {
                          'Gluten-free': glutenFree,
                          'Lactose-free': lactoseFree,
                          'Vegan': vegan,
                          'Vegetarian': vegetarian,
                        };

                        widget.saveFilters(selectedfilters);
                      }),
                ],
              ),
            )
          ],
        ));
  }
}
