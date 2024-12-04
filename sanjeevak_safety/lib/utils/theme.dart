import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_textstyles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light, // Defines the brightness of the theme (Light Mode).

      // Main Color Scheme for the App
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor, // Primary color for buttons, app bars, etc.
        onPrimary: Colors.white, // Text color for content over the primary color.
        secondary: AppColors.secondaryColor, // Secondary accent color.
        onSecondary: Colors.white, // Text color for content over the secondary color.
        surface: AppColors.surfaceColor, // Background color for cards and surfaces.
        error: AppColors.errorColor, // Color for error messages or error UI elements.
        onSurface: AppColors.textColor, // Default text color for surfaces.
      ),

      // Background color for the entire app.
      scaffoldBackgroundColor: AppColors.backgroundColor,

      // AppBar Styling
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceColor, // AppBar's background color.
        elevation: 0, // Removes shadow from AppBar.
        centerTitle: true, // Centers the title text in AppBar.
        titleTextStyle: AppTextStyles.heading1, // Text style for the AppBar's title.
        iconTheme: IconThemeData(color: Colors.white), // Icon color in the AppBar.
      ),

      // Text Theme for global text styles
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.heading1, // Large headers (e.g., titles on major screens).
        displayMedium: AppTextStyles.heading2, // Medium headers (e.g., section titles).
        bodyLarge: AppTextStyles.bodyText, // Main text style for paragraphs or content.
        bodyMedium: AppTextStyles.bodyTextSubdued, // Subdued text for hints or secondary content.
        labelLarge: AppTextStyles.buttonText, // Text style for buttons.
        titleSmall: AppTextStyles.caption, // Text style for small captions or labels.
      ),

      // ElevatedButton Styling (Used for primary actions in the app)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor, // Button background color.
          foregroundColor: Colors.white, // Text color for elevated buttons.
          textStyle: AppTextStyles.buttonText, // Text style for button content.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded edges for buttons.
          ),
        ),
      ),

      // OutlinedButton Styling (Used for secondary or outlined buttons)
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryColor, // Text color for outlined buttons.
          textStyle: AppTextStyles.buttonText, // Text style for button content.
          side: const BorderSide(color: AppColors.primaryColor), // Border color for buttons.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded edges for outlined buttons.
          ),
        ),
      ),

      // Input Field Styling (Used for forms and text inputs)
      inputDecorationTheme: InputDecorationTheme(
        filled: true, // Input fields will have a background color.
        fillColor: AppColors.backgroundColor, // Background color for input fields.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Rounded edges for input fields.
          borderSide: const BorderSide(color: AppColors.borderColor), // Default border color.
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Border for enabled input fields.
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Border for focused input fields.
          borderSide: const BorderSide(color: AppColors.primaryColor), // Highlighted border.
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Border for error states.
          borderSide: const BorderSide(color: AppColors.errorColor), // Error color for borders.
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Spacing inside input fields.
        hintStyle: AppTextStyles.bodyTextSubdued, // Style for placeholder text.
        labelStyle: AppTextStyles.bodyText, // Style for labels.
      ),

      // Floating Action Button Styling (Used for floating actions)
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor, // Background color for FAB.
        foregroundColor: Colors.white, // Icon/text color for FAB.
      ),

      // Icon Theme (Global icon styling)
      iconTheme: const IconThemeData(color: AppColors.textColor), // Default icon color.
    );
  }
}
