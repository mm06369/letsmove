import 'package:flutter/material.dart';

class PauseResumeButton extends StatelessWidget {
  final bool isPaused;
  final VoidCallback onPressed;

  PauseResumeButton({required this.isPaused, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      child: Icon(
        isPaused ? Icons.play_arrow : Icons.pause,
        color: Colors.orange, // Set the icon color to orange
        size: 36.0, // Set the icon size as needed
      ),
    );
  }
}
