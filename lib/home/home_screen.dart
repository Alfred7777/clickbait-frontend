import 'package:flutter/material.dart';
import 'package:clickbait_app/widgets/clickbait_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade900,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey.shade800,
            title: SizedBox(
              height: kToolbarHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Image.asset(
                  'assets/images/logo-clickbait.png',
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.help,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.leaderboard,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClickbaitButton(
                  text: 'TAK',
                  icon: Icons.check,
                  primaryColor: Colors.green.shade300,
                  secondaryColor: Colors.green.shade400,
                  fontSize: 48.0,
                  onPressed: () {},
                ),
                ClickbaitButton(
                  text: 'POMIŃ',
                  icon: Icons.skip_next,
                  primaryColor: Colors.lightBlue.shade600,
                  secondaryColor: Colors.lightBlue.shade700,
                  fontSize: 48.0,
                  onPressed: () {},
                ),
                ClickbaitButton(
                  text: 'NIE',
                  icon: Icons.close,
                  primaryColor: Colors.red.shade300,
                  secondaryColor: Colors.red.shade400,
                  fontSize: 48.0,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
