import 'plant_model.dart';

class Garden {
  final String id; // Unique identifier for the garden
  final String userId; // ID of the user who owns the garden
  final String location; // Location of the garden
  final List<Plant> plants; // List of plants in the garden

  Garden({
    required this.id,
    required this.userId,
    required this.location,
    required this.plants,
  });

  // Factory method to create a Garden object from a map (for MongoDB retrieval)
  factory Garden.fromMap(Map<String, dynamic> map) {
    return Garden(
      id: map['_id'], // MongoDB's default ID field
      userId: map['userId'],
      location: map['location'],
      plants:
          List<Plant>.from(map['plants'].map((plant) => Plant.fromMap(plant))),
    );
  }

  // Convert Garden object to a map (for MongoDB insertion)
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'userId': userId,
      'location': location,
      'plants': plants.map((plant) => plant.toMap()).toList(),
    };
  }
}
