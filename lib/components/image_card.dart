import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCardType {
  late String url;
  late String name;
  late String country;
}
class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.url,
    required this.name,
    required this.country,
  });
  final String url;
  final String name;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              _imageBg(),
              _gradient(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageBg () {
    return Positioned.fill(
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
  Widget _gradient () {
    return Positioned(
      child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.6, 0.95],
            ),
          ),
      ),
    );
  }
  Widget _imageInfo () {
    return Positioned.fill(
      left: 20,
      bottom: 20,
      child: Column(
        children: [
          Text(name, style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
          Text(
            country,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
