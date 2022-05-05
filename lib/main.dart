import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:clickbait_app/home/home_screen.dart';
import 'package:clickbait_app/help/help_screen.dart';
import 'package:clickbait_app/ranking/ranking_screen.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Czy to clickbait?',
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => const HomeScreen(),
        HelpScreen.route: (context) => const HelpScreen(),
        RankingScreen.route: (context) => const RankingScreen(),
      },
    );
  }
}
