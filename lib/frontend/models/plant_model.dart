class Plant {
  final String id; // Unique identifier for each plant
  final String name; // Plant name (e.g., 'Tomato', 'Eggplant')
  final String species; // Plant species or category
  final String imageUrl; // Image of the plant (for TensorFlow analysis)
  final String status; // Health status (e.g., 'Healthy', 'Needs Water')
  final DateTime plantedDate; // Date when the plant was planted
  final double
      growthStage; // Growth stage (e.g., 0.0 for seedling, 1.0 for full-grown)
  final String
      tensorflowResult; // Result from TensorFlow analysis (e.g., 'Healthy', 'Disease Detected')

  Plant({
    required this.id,
    required this.name,
    required this.species,
    required this.imageUrl,
    required this.status,
    required this.plantedDate,
    required this.growthStage,
    required this.tensorflowResult,
  });

  // Factory method to create a Plant object from a map (for MongoDB retrieval)
  factory Plant.fromMap(Map<String, dynamic> map) {
    return Plant(
      id: map['_id'], // MongoDB's default ID field
      name: map['name'],
      species: map['species'],
      imageUrl: map['imageUrl'],
      status: map['status'],
      plantedDate: DateTime.parse(map['plantedDate']),
      growthStage: map['growthStage'].toDouble(),
      tensorflowResult: map['tensorflowResult'],
    );
  }

  // Convert Plant object to a map (for MongoDB insertion)
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'species': species,
      'imageUrl': imageUrl,
      'status': status,
      'plantedDate': plantedDate.toIso8601String(),
      'growthStage': growthStage,
      'tensorflowResult': tensorflowResult,
    };
  }
}
