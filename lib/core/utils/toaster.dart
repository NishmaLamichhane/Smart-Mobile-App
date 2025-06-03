//to avoid the same widget this file is created
// This file contains a utility function to show a toaster message using a SnackBar
// It can be used throughout the app to display brief messages to the user by simply importing this file
import 'package:flutter/material.dart';

void showToaster({
  required BuildContext context,
  required String message,
  Color? backgroundColor,
}) {
  // Hide the keyboard (optional but helpful)
  FocusScope.of(context).unfocus();

  // Fallback color if none provided
  final Color bgColor = backgroundColor ?? Colors.black;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white, // ✅ Make text visible
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: bgColor,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating, // Optional for better visibility
    ),
  );
}
