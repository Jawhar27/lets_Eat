import 'package:flutter/material.dart';
import '../models/hotels.dart';
import '../items/hotel_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Hotel> favMeals;
  FavouriteScreen(this.favMeals);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Lets_Eat'),
      // ),
      body: favMeals.isEmpty
          ? Center(
              child: Text(
                'No favourite foods !',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return HotelItem(
                    id: favMeals[index].id,
                    title: favMeals[index].title,
                    imgUrl: favMeals[index].imageUrl,
                    duration: favMeals[index].duration,
                    complexity: favMeals[index].complexity,
                    affordability: favMeals[index].affordability);
              },
              itemCount: favMeals.length,
            ),
    );
  }
}
