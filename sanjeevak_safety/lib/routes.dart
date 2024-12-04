import 'package:flutter/material.dart';
import 'package:sanjeevak_safety/screens/home.dart';
import 'package:sanjeevak_safety/screens/login_screen.dart';
import 'package:sanjeevak_safety/screens/onboarding/onboarding_view.dart';
import 'package:sanjeevak_safety/screens/verify_otp.dart';

class Routes {
  static const String initial = '/'; // Initial route
  static const String home = '/home'; // home screen route
  static const String login = '/login'; // Login screen route
  static const String onboarding = '/onboarding'; // onboarding screen route
  static const String verifyOtp = '/verifyOtp'; // onboarding screen route

  // Generate routes dynamically
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case verifyOtp:
        return MaterialPageRoute(
          builder: (_) => VerifyOtpScreen(),
        );
      default:
        return _errorRoute(); // Route for undefined paths
    }
  }

  // Error Route
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      ),
    );
  }
}
