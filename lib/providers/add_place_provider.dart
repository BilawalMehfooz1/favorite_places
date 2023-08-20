import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/models/places_structure.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class AddPlaceNotifier extends StateNotifier<List<PlacesStructure>> {
  AddPlaceNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final newPlace = PlacesStructure(
      title: title,
      image: copiedImage,
      location: location,
    );
    state = [newPlace, ...state];
  }
}

final addPlaceProvider =
    StateNotifierProvider<AddPlaceNotifier, List<PlacesStructure>>(
  (ref) => AddPlaceNotifier(),
);
