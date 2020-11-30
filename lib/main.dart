import 'package:flutter/material.dart';
import 'package:lets_eat/sampleData.dart';
import 'package:lets_eat/screens/filter_screen.dart';
import 'package:lets_eat/screens/hotel_item_screen.dart';
import 'package:lets_eat/screens/hotels_screen.dart';
import './screens/tab_screen.dart';
import './models/hotels.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //initial filters
  Map<String, bool> filters = {
    'Gluten-free': false,
    'Lactose-free': false,
    'Vegan': false,
    'Vegetarian': false,
  };
  //favourite meals
  List<Hotel> favMeals = [];

  List<Hotel> availableMeals = SAMPLE_HOTELS;
  void saveFilters(Map<String, bool> filteredData) {
    setState(() {
      filters = filteredData;
    });
    availableMeals = SAMPLE_HOTELS.where((hotel) {
      if (filters['Gluten-free'] && !hotel.isGlutenFree) {
        return false;
      }
      if (filters['Lactose-free'] && !hotel.isLactoseFree) {
        return false;
      }
      if (filters['Vegan'] && !hotel.isVegan) {
        return false;
      }
      if (filters['Vegetarian'] && !hotel.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  //adding removing fav meals
  void favMealSelect(String id) {
    final existingIndex = favMeals.indexWhere((meal) => meal.id == id);

    if (existingIndex < 0) {
      setState(() {
        favMeals.add(SAMPLE_HOTELS.firstWhere((meal) => meal.id == id));
      });
    } else {
      setState(() {
        favMeals.removeAt(existingIndex);
      });
    }
  }

  //checking fav or not
  bool isFav(String id) {
    return (favMeals.any((meal) => meal.id == id));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets_EAT',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                fontSize: 17,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: TabScreen(favMeals),
      routes: {
        // '/': (cnt) => TabScreen(),
        '/hotels-screen': (cnt) => HotelsScreen(availableMeals),
        '/hotel-item-screen': (cnt) => HotelItemScreen(favMealSelect, isFav),
        '/filter-screen': (cnt) => FilterScreen(saveFilters, filters),
      },
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('BURIYANI')),
          ),
          body: Column(
            children: [],
          )),
    );
  }
}
