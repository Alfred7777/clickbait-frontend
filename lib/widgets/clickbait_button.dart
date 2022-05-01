import 'package:flutter/material.dart';

class ClickbaitButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color primaryColor;
  final Color secondaryColor;
  final double fontSize;
  final VoidCallback onPressed;

  const ClickbaitButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.primaryColor,
    required this.secondaryColor,
    required this.fontSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: fontSize * 0.08,
        ),
        borderRadius: BorderRadius.circular(fontSize * 0.52),
      ),
      child: OutlinedButton(
        key: key,
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: fontSize * 0.1,
                right: fontSize * 0.05,
              ),
              child: icon != null ? Icon(
                icon,
                size: fontSize,
              ) : SizedBox(
                width: fontSize * 0.15,
              ),
            ),
            Text(text),
          ],
        ),
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: primaryColor,
          elevation: 0,
          padding: EdgeInsets.only(
            top: fontSize * 0.32,
            bottom: fontSize * 0.4,
            left: fontSize * 0.2,
            right: fontSize * 0.4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(fontSize * 0.4),
          ),
          side: BorderSide(
            width: fontSize * 0.1,
            color: secondaryColor,
          ),
          textStyle: TextStyle(
            fontFamily: 'Titan One',
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
