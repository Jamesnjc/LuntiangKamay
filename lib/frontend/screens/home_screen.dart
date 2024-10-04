import 'package:flutter/material.dart';
import 'package:luntiang_kamay/frontend/auth/auth_provider.dart';
import 'package:luntiang_kamay/frontend/models/plant_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final plants = Provider.of<List<Plant>>(
        context); // Ensure it defaults to an empty list

    return Scaffold(
      appBar: AppBar(
        title: Text('My Garden'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authProvider.logout(); // Call logout method
              Navigator.pushReplacementNamed(
                  context, '/login'); // Redirect to login
            },
          ),
        ],
      ),
      body: plants.isEmpty
          ? Center(
              child:
                  Text('No plants added yet!')) // Display message if no plants
          : ListView.builder(
              itemCount: plants.length,
              itemBuilder: (context, index) {
                final plant = plants[index];
                return ListTile(
                  leading: Image.network(
                      plant.imageUrl), // Displaying the plant image
                  title: Text(plant.name),
                  subtitle: Text('Status: ${plant.status}'),
                  onTap: () {
                    // Navigate to the plant details screen
                    Navigator.pushNamed(context, '/plantDetail',
                        arguments: plant);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
              context, '/addPlant'); // Navigate to add plant screen
        },
        child: Icon(Icons.add),
        tooltip: 'Add Plant',
      ),
    );
  }
}
