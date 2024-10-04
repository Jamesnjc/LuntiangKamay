import 'package:flutter/foundation.dart'; // Import for ChangeNotifier
import 'package:http/http.dart' as http; // Example for making network requests
import 'dart:convert'; // To convert data to JSON

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _errorMessage;

  bool get isAuthenticated => _isAuthenticated;
  String? get errorMessage => _errorMessage;

  Future<void> login(String email, String password) async {
    // Here you would implement the logic to authenticate the user with your backend
    // Example using http package
    try {
      final response = await http.post(
        Uri.parse('YOUR_API_ENDPOINT'), // Replace with your API endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        _isAuthenticated = true; // Set authentication state
        notifyListeners(); // Notify listeners about state change
      } else {
        _errorMessage = 'Login failed. Please try again.';
        notifyListeners(); // Notify listeners about the error
        throw Exception(_errorMessage); // Throw an error to handle in the UI
      }
    } catch (error) {
      _errorMessage = error.toString();
      notifyListeners(); // Notify listeners about the error
      throw error; // Re-throw the error for UI handling
    }
  }
}
