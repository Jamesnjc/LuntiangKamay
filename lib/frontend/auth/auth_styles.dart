import 'package:flutter/material.dart';

class AuthStyles {
  // Style for headers/titles
  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: Colors.green, // Green to align with the theme
    letterSpacing: 1.2, // Slight letter spacing for better readability
  );

  // Style for input text fields
  static const TextStyle inputTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  // Button style for all action buttons
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white, // Text color
    backgroundColor: Colors.green, // Button color
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
    textStyle: const TextStyle(
      fontSize: 18, // Font size for button text
      fontWeight: FontWeight.w500, // Slightly bolder font for emphasis
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Rounded corners for buttons
    ),
    elevation: 3, // Button shadow for depth
  );
}
