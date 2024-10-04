class User {
  final String id; // Unique identifier for the user
  final String name; // Name of the user
  final String email; // Email of the user
  final List<String>
      preferences; // List of user preferences (e.g., favorite plants)

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.preferences,
  });

  // Factory method to create a User object from a map (for MongoDB retrieval)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'], // MongoDB's default ID field
      name: map['name'],
      email: map['email'],
      preferences: List<String>.from(map['preferences']),
    );
  }

  // Convert User object to a map (for MongoDB insertion)
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'preferences': preferences,
    };
  }
}
