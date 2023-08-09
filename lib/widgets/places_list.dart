import 'package:flutter/material.dart';
import 'package:favorite_places/models/places_structure.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.placesList});

  final List<PlacesStructure> placesList;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    Widget? content;

    if (placesList.isEmpty) {
      content = const Center(
        child: Text('No places added yet.'),
      );
    } else {
      content = ListView.builder(
        itemCount: placesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              placesList[index].title,
              style: style.textTheme.titleMedium!.copyWith(
                color: style.colorScheme.onBackground,
              ),
            ),
          );
        },
      );
    }

    return content;
  }
}
