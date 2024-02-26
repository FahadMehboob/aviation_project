import 'package:aviation_project/ui/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aviation',
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          bodyLarge: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.grey,
            fontSize: 22,
          ),
          titleSmall: TextStyle(
            color: Colors.grey,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.lightBlue,
      ),
      home: const SplashScreen(),
    );
  }
}
