import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/models/places_structure.dart';

class AddPlaceNotifier extends StateNotifier<List<PlacesStructure>> {
  AddPlaceNotifier() : super(const []);

  void addPlace(String title, File image) {
    final newPlace = PlacesStructure(
      title: title,
      image: image,
    );
    state = [newPlace, ...state];
  }
}

final addPlaceProvider =
    StateNotifierProvider<AddPlaceNotifier, List<PlacesStructure>>(
  (ref) => AddPlaceNotifier(),
);
