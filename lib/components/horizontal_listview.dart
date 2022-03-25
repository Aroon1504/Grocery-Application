import 'package:flutter/material.dart';

class HorziontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: "assets/cat/veg.png",
            image_caption: 'Vegetable',
          ),
          Category(
            image_location: "assets/cat/orange.png",
            image_caption: 'Fruits',
          ),
          Category(
            image_location: "assets/cat/bakery.png",
            image_caption: 'Bakery',
          ),
          Category(
            image_location: "assets/cat/drink.png",
            image_caption: 'Drinks',
          ),
          Category(
            image_location: "assets/cat/spices.png",
            image_caption: 'Spices',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({required this.image_location, required this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 90,
          child: ListTile(
              title: Image.asset(
                image_location,
                // width: 80.0,
                // height: 50.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                  style: new TextStyle(fontSize: 12.0),
                ),
              )),
        ),
      ),
    );
  }
}
