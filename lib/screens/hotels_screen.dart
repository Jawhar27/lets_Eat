import 'package:flutter/material.dart';
import '../items/hotel_item.dart';

import '../models/hotels.dart';

class HotelsScreen extends StatelessWidget {
  final List<Hotel> availableMeals;
  HotelsScreen(this.availableMeals);
  // final String id;
  // final String title;
  // final Color color;
  // HotelsScreen({this.id, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryHotels = availableMeals
        .where((hotel) => hotel.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return HotelItem(
              id: categoryHotels[index].id,
              title: categoryHotels[index].title,
              imgUrl: categoryHotels[index].imageUrl,
              duration: categoryHotels[index].duration,
              complexity: categoryHotels[index].complexity,
              affordability: categoryHotels[index].affordability);
        },
        itemCount: categoryHotels.length,
      ),
    );
  }
}
