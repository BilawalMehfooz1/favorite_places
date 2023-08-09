import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/providers/add_place_provider.dart';

import 'package:favorite_places/widgets/places_list.dart';
import 'package:favorite_places/screens/add_place_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // For opening add_place_screen area
  void _onAddPlace(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const AddPlaceScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(addPlaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              _onAddPlace(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(placesList: userPlaces),
      ),
    );
  }
}
