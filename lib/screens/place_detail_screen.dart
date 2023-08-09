import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/models/places_structure.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({
    super.key,
    required this.place,
  });
  final PlacesStructure place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
