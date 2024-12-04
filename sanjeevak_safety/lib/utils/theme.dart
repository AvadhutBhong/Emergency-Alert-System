import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_textstyles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Main Color Scheme for the App
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        onPrimary: Colors.white,
        secondary: AppColors.secondaryColor,
        onSecondary: Colors.white,
        surface: AppColors.surfaceColor,
        error: AppColors.errorColor,
        onSurface: AppColors.textColor,
      ),

      scaffoldBackgroundColor: AppColors.backgroundColor,

      // AppBar Styling
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.heading1,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      // Text Theme for global text styles
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.heading1,
        displayMedium: AppTextStyles.heading2,
        bodyLarge: AppTextStyles.bodyText,
        bodyMedium: AppTextStyles.bodyTextSubdued,
        labelLarge: AppTextStyles.buttonText,
        titleSmall: AppTextStyles.caption,
      ),

      // ElevatedButton Styling
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          textStyle: AppTextStyles.buttonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // More modern rounded buttons
          ),
        ),
      ),

      // Input Field Styling
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), // More rounded edges
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.textColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColors.errorColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintStyle: AppTextStyles.bodyTextSubdued.copyWith(fontSize: 14),
        labelStyle: AppTextStyles.bodyText.copyWith(fontSize: 14, color: AppColors.textColor),
      ),

      // Floating Action Button Styling
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
      ),

      iconTheme: const IconThemeData(color: AppColors.textColor),
    );
  }
}
