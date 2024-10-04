import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String baseUrl =
      'http://your-backend-url/api/auth'; // Replace with your backend URL
  String? _authToken; // To store authentication token

  // Getter for the auth token
  String? get authToken => _authToken;

  // Login method
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        _authToken = responseData['token']; // Store token if available
        return true;
      } else {
        print('Login failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }

  // Register method
  Future<bool> register(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        return true; // Registration successful
      } else {
        print('Registration failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error during registration: $e');
      return false;
    }
  }

  // Password reset method
  Future<bool> resetPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/reset-password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        return true; // Password reset successful
      } else {
        print('Password reset failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error during password reset: $e');
      return false;
    }
  }

  // Optional: Logout method to clear token and perform cleanup
  void logout() {
    _authToken = null; // Clear the stored auth token
  }
}
