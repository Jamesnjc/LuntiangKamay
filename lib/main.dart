import 'package:flutter/material.dart';
import 'package:luntiang_kamay/frontend/auth/auth_provider.dart';
import 'package:luntiang_kamay/frontend/auth/login_screen.dart';
import 'package:luntiang_kamay/frontend/auth/registration_screen.dart';
import 'package:luntiang_kamay/frontend/providers/plant_provider.dart';
import 'package:luntiang_kamay/frontend/screens/add_plant_screen.dart';
import 'package:luntiang_kamay/frontend/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider()), // Provider for authentication
        ChangeNotifierProvider(
            create: (_) => PlantProvider()), // Provider for managing plant data
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luntiang Kamay',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/login', // Start at the login screen
      routes: {
        '/login': (context) => LoginScreen(), // Login screen
        '/register': (context) => RegistrationScreen(), // Registration screen
        '/home': (context) => HomeScreen(), // Home screen
        '/addPlant': (context) =>
            AddPlantScreen(), // Screen for adding a new plant
        // Add other routes here as needed
      },
    );
  }
}
