import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/models/places_structure.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

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

    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT,image TEXT,lat REAL,lng REAL,address TEXT)');
      },
      version: 1,
    );
    db.insert(
      'user_places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
        'lat': newPlace.location.latitute,
        'lng': newPlace.location.longitude,
        'address': newPlace.location.longitude,
      },
    );

    state = [newPlace, ...state];
  }
}

final addPlaceProvider =
    StateNotifierProvider<AddPlaceNotifier, List<PlacesStructure>>(
  (ref) => AddPlaceNotifier(),
);
