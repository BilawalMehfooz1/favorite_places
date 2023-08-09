import 'package:flutter/material.dart';
import 'package:favorite_places/widgets/add_place.dart';

class AddPlaceScreen extends StatelessWidget {
  const AddPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: const AddPlace(),
    );
  }
}
