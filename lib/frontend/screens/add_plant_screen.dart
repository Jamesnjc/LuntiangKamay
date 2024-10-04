import 'package:flutter/material.dart';
import 'package:luntiang_kamay/frontend/models/plant_model.dart';
import 'package:luntiang_kamay/frontend/providers/plant_provider.dart';
import 'package:provider/provider.dart';

class AddPlantScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _growthStageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Plant'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Plant Name'),
            ),
            TextField(
              controller: _speciesController,
              decoration: InputDecoration(labelText: 'Species'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _statusController,
              decoration: InputDecoration(labelText: 'Status'),
            ),
            TextField(
              controller: _growthStageController,
              decoration:
                  InputDecoration(labelText: 'Growth Stage (0.0 - 1.0)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addPlant(context);
              },
              child: Text('Add Plant'),
            ),
          ],
        ),
      ),
    );
  }

  void _addPlant(BuildContext context) {
    final plantProvider = Provider.of<PlantProvider>(context, listen: false);

    // Create a new Plant object
    final newPlant = Plant(
      id: DateTime.now().toString(), // Generate a unique ID
      name: _nameController.text,
      species: _speciesController.text,
      imageUrl: _imageUrlController.text,
      status: _statusController.text,
      plantedDate: DateTime.now(), // Set the current date as planted date
      growthStage: double.tryParse(_growthStageController.text) ?? 0.0,
      tensorflowResult: 'Healthy', // Default status for a newly added plant
    );

    // Add the plant using the provider
    plantProvider.addPlant(newPlant);

    // Navigate back to the home screen
    Navigator.pop(context);
  }
}
