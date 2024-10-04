import 'package:flutter/material.dart';
import 'auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isAuthenticated = false;
  String? _errorMessage; // To display error messages
  bool _isLoading = false; // Loading state for UI feedback

  // Getters for authentication status, error message, and loading state
  bool get isAuthenticated => _isAuthenticated;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  // Login method
  Future<void> login(String email, String password) async {
    _errorMessage = null; // Reset error message before attempting login
    _isLoading = true;
    notifyListeners(); // Notify UI to show loading spinner

    try {
      final success = await _authService.login(email, password);

      if (success) {
        _isAuthenticated = true; // Set authentication state to true
        _errorMessage = null; // Clear any previous errors
      } else {
        _errorMessage =
            'Login failed. Please check your credentials and try again.';
      }
    } catch (e) {
      _errorMessage = 'An error occurred during login: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about state change
    }
  }

  // Registration method
  Future<void> register(String email, String password) async {
    _errorMessage = null; // Reset error message before attempting registration
    _isLoading = true;
    notifyListeners();

    try {
      final success = await _authService.register(email, password);

      if (success) {
        _isAuthenticated = true; // Assume registration also logs in the user
        _errorMessage = null; // Clear any previous errors
      } else {
        _errorMessage = 'Registration failed. Please try again.';
      }
    } catch (e) {
      _errorMessage = 'An error occurred during registration: $e';
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners about state change
    }
  }

  // Password reset method
  Future<void> resetPassword(String email) async {
    _errorMessage =
        null; // Reset error message before attempting password reset
    _isLoading = true;
    notifyListeners();

    try {
      final success = await _authService.resetPassword(email);

      if (success) {
        _errorMessage =
            'Password reset instructions sent. Please check your email.';
      } else {
        _errorMessage =
            'Failed to send password reset instructions. Please try again.';
      }
    } catch (e) {
      _errorMessage = 'An error occurred during password reset: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Logout method
  void logout() {
    _isAuthenticated = false; // Set authentication state to false
    notifyListeners(); // Notify listeners about state change
  }
}
