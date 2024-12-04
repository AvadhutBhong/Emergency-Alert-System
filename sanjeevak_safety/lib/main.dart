import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sanjeevak_safety/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding")??false;
  runApp(MyApp(onboarding: onboarding,));
}

class MyApp extends StatefulWidget {
  final bool onboarding;
  const MyApp({super.key, required this.onboarding});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  void initialization() async{
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanjeevak Safety',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Applying the light theme
      initialRoute: Routes.bottomNavbar, // Initial route
      onGenerateRoute: Routes.generateRoute, // Route generator for navigation
    );
  }
}
