import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/models/places_structure.dart';

class AddPlaceNotifier extends StateNotifier<List<PlacesStructure>> {
  AddPlaceNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) {
    final newPlace = PlacesStructure(
      title: title,
      image: image,
      location: location,
    );
    state = [newPlace, ...state];
  }
}

final addPlaceProvider =
    StateNotifierProvider<AddPlaceNotifier, List<PlacesStructure>>(
  (ref) => AddPlaceNotifier(),
);
