import 'package:flutter/material.dart';

class CircularProgressPercentageExample extends StatefulWidget {
  @override
  _CircularProgressPercentageExampleState createState() => _CircularProgressPercentageExampleState();
}

class _CircularProgressPercentageExampleState extends State<CircularProgressPercentageExample> {
  double _progress = 0.6; // Example progress value (0.6 = 60%)

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              value: _progress, // Progress value between 0.0 and 1.0
            ),
            SizedBox(height: 16),
            Text(
              '${(_progress * 100).toStringAsFixed(0)}%', // Display progress in percentage
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
    );
  }
}

