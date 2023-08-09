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
    );
  }
}
