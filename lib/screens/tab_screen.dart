import 'package:flutter/material.dart';
import 'package:lets_eat/screens/category_screen.dart';
import 'package:lets_eat/screens/favourite_screen.dart';
import 'package:lets_eat/screens/mainDrawyer_screen.dart';
import '../models/hotels.dart';

class TabScreen extends StatefulWidget {
  final List<Hotel> favMeals;
  TabScreen(this.favMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  List<Map<String, Object>> pages;

  @override
  void initState() {
    pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavouriteScreen(widget.favMeals), 'title': 'Your_Favourites'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(pages[selectedPageIndex]['title'])),
      ),
      drawer: MainDrawyer(),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Categories',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'favourites',
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
