import 'package:flutter/material.dart';
import 'package:words_record/components/image_card.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FoodPage();
  }
}

class _FoodPage extends State<FoodPage> {
  List<Widget> foodList = [
    ImageCard(
        url:
            'https://docs.flutter.dev/cookbook/img-files/effects/parallax/01-mount-rushmore.jpg',
        name: "Mount Rushmore",
        country: "U.S.A"),
    ImageCard(
        url:
            'https://docs.flutter.dev/cookbook/img-files/effects/parallax/02-singapore.jpg',
        name: "Gardens By The Bay",
        country: "Singapore"),
    ImageCard(
        url:
            'https://docs.flutter.dev/cookbook/img-files/effects/parallax/03-machu-picchu.jpg',
        name: "Machu Picchu",
        country: "Peru"),
    ImageCard(
      name: 'Vitznau',
      country: 'Switzerland',
      url:
          'https://docs.flutter.dev/cookbook/img-files/effects/parallax/04-vitznau.jpg',
    ),
    ImageCard(
      name: 'Bali',
      country: 'Indonesia',
      url:
          'https://docs.flutter.dev/cookbook/img-files/effects/parallax/05-bali.jpg',
    ),
    ImageCard(
      name: 'Mexico City',
      country: 'Mexico',
      url:
          'https://docs.flutter.dev/cookbook/img-files/effects/parallax/06-mexico-city.jpg',
    ),
    ImageCard(
      name: 'Cairo',
      country: 'Egypt',
      url:
          'https://docs.flutter.dev/cookbook/img-files/effects/parallax/07-cairo.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: foodList,
        ),
      ),
    );
  }
}
