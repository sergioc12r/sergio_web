import 'package:flutter/material.dart';

class CuGradientButton extends StatelessWidget {
  CuGradientButton({super.key, required this.callback, required this.title});

  final Function() callback;
  final String title;

  final List<Color> gradientColors = [
    Color(0xFF007BFF),
    Color(0xFF00C7FF),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: <Widget>[
            Icon(
              Icons.send,
              color: Theme.of(context).iconTheme.color,
            ),
            Text(
              title,
            ),
          ],
        ),
      ),
    );
  }
}
