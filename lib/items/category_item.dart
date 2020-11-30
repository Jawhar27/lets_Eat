import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem(this.title, this.color, this.id);

  void selectHotels(BuildContext cnt) {
    Navigator.of(cnt)
        .pushNamed('/hotels-screen', arguments: {'title': title, 'id': id});
    // Navigator.of(cnt).push(MaterialPageRoute(
    //     builder: (_) => HotelsScreen(
    //           title: title,
    //           color: color,
    //           id: id,
    //         )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectHotels(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15), //same as grid radius
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.bodyText1),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withOpacity(0.7), color],
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
