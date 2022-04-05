import 'package:flutter/material.dart';
import 'package:clickbait_app/widgets/top_bar.dart';
import 'package:clickbait_app/widgets/clickbait_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: <Widget>[
              const TopBar(),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth < 600 ? 18 : 24,
                    ),
                    child: ClickbaitTitle(
                      title: 'Ogromne sankcje na córki Putina robią wrażenie! Nowe doniesienia amerykańskich mediów.',
                      fontSize: constraints.maxWidth < 600 ? 24 : 28,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: constraints.maxWidth < 600 ? 24 : 32,
                  horizontal: constraints.maxWidth < 600 ? 18 : 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ClickbaitButton(
                      text: 'TAK',
                      icon: Icons.check,
                      primaryColor: Colors.green.shade300,
                      secondaryColor: Colors.green.shade400,
                      fontSize: constraints.maxWidth < 600 ? 36 : 44,
                      onPressed: () {},
                    ),
                    ClickbaitButton(
                      text: 'NIE',
                      icon: Icons.close,
                      primaryColor: Colors.red.shade300,
                      secondaryColor: Colors.red.shade400,
                      fontSize: constraints.maxWidth < 600 ? 36 : 44,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: constraints.maxWidth < 600 ? 108 : 144,
                ),
                child: ClickbaitButton(
                  text: 'POMIŃ',
                  icon: Icons.skip_next,
                  primaryColor: Colors.lightBlue.shade600,
                  secondaryColor: Colors.lightBlue.shade700,
                  fontSize: constraints.maxWidth < 600 ? 36 : 44,
                  onPressed: () {},
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ClickbaitTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const ClickbaitTitle({
    Key? key,
    required this.title,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
