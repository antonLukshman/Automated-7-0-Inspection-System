import 'package:flutter/material.dart';

// Consistent spacing values
class AppSpacing {
  static const double xs = 4.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

// Consistent text styles
class AppTextStyles {
  static TextStyle get heading1 => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      );

  static TextStyle get heading2 => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get subtitle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      );

  static TextStyle get body => const TextStyle(
        fontSize: 16,
        color: Colors.black87,
      );

  static TextStyle get caption => const TextStyle(
        fontSize: 14,
        color: Colors.black54,
      );
}

// Consistent colors
class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFB00020);
  static const Color onPrimary = Colors.white;
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
}

// Consistent component styles
class AppStyles {
  // Card style
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      );

  // Button style
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
        minimumSize: Size(250, 60), // Set default width and height
        //backgroundColor: const Color.fromARGB(255, 23, 91, 25),
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );

  static ButtonStyle selecButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(150, 50), // Set default width and height
    backgroundColor: Colors.blue, // Background color (replaces 'primary')
    foregroundColor: Colors.white, // Text color (replaces 'onPrimary')
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
  );

  static ButtonStyle deselecButtonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(150, 50), // Set default width and height
    backgroundColor: const Color.fromARGB(
        255, 6, 42, 71), // Background color (replaces 'primary')
    foregroundColor: Colors.white, // Text color (replaces 'onPrimary')
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
  );

  // Input field style
  static InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}

class ContainerStyle {
  // Define some styles for containers
  static BoxDecoration primaryContainerStyle = BoxDecoration(
    color: Colors.blueAccent, // Background color of the container
    borderRadius: BorderRadius.circular(12), // Rounded corners
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 5,
        offset: Offset(0, 4),
      ),
    ],
  );

  static BoxDecoration secondaryContainerStyle = BoxDecoration(
    color: Colors.greenAccent,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  );


  static Widget reusableContainer({
    required Widget child,
  }) {
    return Container(
      width: 210, // Fixed width for the container
      padding: const EdgeInsets.all(16), // Padding inside the container
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 48, 159, 59), // Background color of the container
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child, // The content of the container
    );
  }

  static Widget reusableContainer2({
    required Widget child,
  }) {
    return Container(
      width: 130, // Fixed width for the container
      padding: const EdgeInsets.all(16), // Padding inside the container
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 214, 221, 220), // Background color of the container
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child, // The content of the container
    );
  }
}
