import 'package:flutter/material.dart';
import 'package:screen_app/screen/auth_screen.dart';
import 'package:screen_app/screen/auth_screen_signup.dart';
import 'package:screen_app/screen/appbar_custom.dart';
import 'package:screen_app/screen/exercises_detail_screen.dart';
import 'package:screen_app/screen/exercises_screen.dart';
import 'package:screen_app/screen/introduction.dart';

void main() {
  runApp(const AppScreen());
}

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: /*const AuthScreen(),*/
          /*const AuthScreenSignUp(),*/
          // const Introduction(),
          // const ExercisesScreen(),
          const ExercisesDetailScreen(),
    );
  }
}
