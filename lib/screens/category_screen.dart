import 'package:flutter/material.dart';
import 'package:lets_eat/items/category_item.dart';

import '../sampleData.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text('BURIYANI_MENU')),
      // ),
      body: GridView(
          padding: EdgeInsets.all(25),
          children: SAMPLE_CATEGORIES.map((category) {
            return CategoryItem(category.title, category.color, category.id);
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 2,
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          )),
    );
  }
}
