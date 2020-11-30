import 'package:flutter/material.dart';
import '../sampleData.dart';

class HotelItemScreen extends StatelessWidget {
  final Function selectFav;
  final Function isFav;
  HotelItemScreen(this.selectFav, this.isFav);
  Widget buildTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      height: 150,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedHotels = SAMPLE_HOTELS.firstWhere((hotel) {
      return hotel.id == routeArgs['id'];
    });
    return Scaffold(
      appBar: AppBar(title: Text(selectedHotels.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedHotels.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, 'ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.yellow,
                    child: Text(selectedHotels.ingredients[index],
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16)),
                  );
                },
                itemCount: selectedHotels.ingredients.length,
              ),
            ),
            buildTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${(index + 1)}'),
                        ),
                        title: Text(selectedHotels.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedHotels.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: isFav(routeArgs['id'])
              ? Icon(Icons.star_border)
              : Icon(Icons.star),
          onPressed: () => selectFav(routeArgs['id'])),
    );
  }
}
