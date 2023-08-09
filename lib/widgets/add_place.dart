import 'dart:io';

import 'package:flutter/material.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/providers/add_place_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  // Method to save the places
  void _savePlace() {
    var enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }
    ref.read(addPlaceProvider.notifier).addPlace(
          enteredTitle,
          _selectedImage!,
        );
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: _titleController,
            style: TextStyle(color: style.colorScheme.onBackground),
          ),
          const SizedBox(height: 10),
          ImageInput(
            onPickImage: (image) {
              _selectedImage = image;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
          )
        ],
      ),
    );
  }
}
