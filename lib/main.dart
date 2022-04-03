import 'package:flutter/material.dart';
import 'package:clickbait_app/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Czy to clickbait?',
      home: HomeScreen(),
    );
  }
}
