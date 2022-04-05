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
          padding: EdgeInsets.only(
            top: constraints.maxWidth < 600 ? 32 : 40,
            left: constraints.maxWidth < 600 ? 18 : 24,
            right: constraints.maxWidth < 600 ? 18 : 24,
          ),
          child: Container(
            height: constraints.maxWidth < 600 ? 80 : 96,
            width: constraints.maxWidth,
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
                TopBarButton(
                  icon: Icons.help,
                  iconSize: constraints.maxWidth < 600 ? 30 : 36,
                  padding: constraints.maxWidth < 600 ? 12 : 16,
                  onPressed: () {
                    Navigator.pushNamed(context, '/help');
                  },
                ),
                TopBarButton(
                  icon: Icons.leaderboard,
                  iconSize: constraints.maxWidth < 600 ? 30 : 36,
                  padding: constraints.maxWidth < 600 ? 12 : 16,
                  onPressed: () {
                    Navigator.pushNamed(context, '/ranking');
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class TopBarButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final double padding;
  final VoidCallback onPressed;

  const TopBarButton({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.padding,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: padding,
      ),
      child: TextButton(
        child: Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        onPressed: onPressed,
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
    );
}
}
