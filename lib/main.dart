// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iot_based_weather_station/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'package:window_size/window_size.dart'; // Import the window_size package
import 'dart:io' show Platform; //for Platform.isWindows

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set the window size for Windows desktop builds.
  if (Platform.isWindows) {
    setWindowMinSize(const Size(400, 650)); //Minimum size
    setWindowMaxSize(const Size(600, 800)); //Maximum size.
    //Set the initial size
    setWindowFrame(
        const Rect.fromLTWH(100, 100, 480, 720)); // Left, Top, Width, Height
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
