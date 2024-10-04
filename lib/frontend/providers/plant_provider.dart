import 'package:flutter/material.dart';
import 'package:luntiang_kamay/frontend/models/plant_model.dart';

class PlantProvider with ChangeNotifier {
  List<Plant> _plants = [];

  List<Plant> get plants => _plants;

  // Add a new plant to the list
  void addPlant(Plant plant) {
    _plants.add(plant);
    notifyListeners(); // Notify listeners of the change
  }

  // Remove a plant from the list by its ID
  void removePlant(String id) {
    _plants.removeWhere((plant) => plant.id == id);
    notifyListeners(); // Notify listeners of the change
  }

  // Optionally, you could add methods to update plant information
  void updatePlant(Plant updatedPlant) {
    int index = _plants.indexWhere((plant) => plant.id == updatedPlant.id);
    if (index != -1) {
      _plants[index] = updatedPlant;
      notifyListeners(); // Notify listeners of the change
    }
  }

  // Load plants from a data source, e.g., MongoDB
  Future<void> loadPlants() async {
    // Fetch plants from your backend or database
    // For now, let's simulate with some dummy data
    _plants = [
      Plant(
        id: '1',
        name: 'Tomato',
        species: 'Solanum lycopersicum',
        imageUrl: 'https://example.com/tomato.png',
        status: 'Healthy',
        plantedDate: DateTime.now(),
        growthStage: 0.5,
        tensorflowResult: 'Healthy',
      ),
      Plant(
        id: '2',
        name: 'Eggplant',
        species: 'Solanum melongena',
        imageUrl: 'https://example.com/eggplant.png',
        status: 'Needs Water',
        plantedDate: DateTime.now(),
        growthStage: 0.3,
        tensorflowResult: 'Needs Water',
      ),
      // Add more plants as needed
    ];
    notifyListeners(); // Notify listeners of the loaded data
  }
}
