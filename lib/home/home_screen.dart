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
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade800,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const TopBar(),
                const SizedBox(height: 40,),
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
