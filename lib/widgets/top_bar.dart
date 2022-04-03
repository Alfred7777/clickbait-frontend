import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: constraints.maxWidth < 600 ? 32 : 40,
            horizontal: constraints.maxWidth < 600 ? 18 : 24,
          ),
          child: SizedBox(
            height: constraints.maxWidth < 600 ? 80 : 96,
            width: constraints.maxWidth,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  constraints.maxWidth < 600 ? 24 : 32,
                ),
                color: Colors.blueGrey.shade900,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: constraints.maxWidth < 600 ? 18 : 24,
                      bottom: constraints.maxWidth < 600 ? 18 : 24,
                      left: constraints.maxWidth < 600 ? 24 : 30,
                    ),
                    child: Image.asset(
                      'assets/images/logo-clickbait.png',
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: constraints.maxWidth < 600 ? 12 : 16,
                    ),
                    child: TextButton(
                      child: Icon(
                        Icons.help,
                        color: Colors.white,
                        size: constraints.maxWidth < 600 ? 30 : 36,
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(0, 0),
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.zero,
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        overlayColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: constraints.maxWidth < 600 ? 12 : 16,
                    ),
                    child: TextButton(
                      child: Icon(
                        Icons.leaderboard,
                        color: Colors.white,
                        size: constraints.maxWidth < 600 ? 30 : 36,
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(0, 0),
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.zero,
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        overlayColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
