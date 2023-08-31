import 'package:flutter/material.dart';
import 'dart:math';

import '../../globals.dart';

class CircleSliderPainter extends CustomPainter {
  final double sliderValue;
  final double dotRadius;

  CircleSliderPainter({
    required this.sliderValue,
    required this.dotRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 3);
    final radius = min(size.width, size.height) / 4;

    // Draw the circle background
    final backgroundPaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the circle border
    final borderPaint = Paint()
      ..color = Colors.orange[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(center, radius - 1.0, borderPaint);

    // Calculate the angle of the dot
    final angle = 2 * pi * sliderValue - pi / 2;
    final dotX = center.dx + radius * cos(angle);
    final dotY = center.dy + radius * sin(angle);

    // Draw the draggable dot
    final dotPaint = Paint()..color = Colors.orange;
    canvas.drawCircle(Offset(dotX, dotY), dotRadius, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CircleSlider extends StatefulWidget {
  @override
  _CircleSliderState createState() => _CircleSliderState();
}

class _CircleSliderState extends State<CircleSlider> {
  double _sliderValue = 0.0;

  void _updateSliderValue(double newValue) {
    setState(() {
      _sliderValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onPanUpdate: (details) {
            // Calculate the angle of the drag
            final center = MediaQuery.of(context).size.width / 2;
            final dx = details.localPosition.dx - center;
            final dy = details.localPosition.dy - center;
            final angle = atan2(dy, dx) + pi / 2;

            // Calculate the new slider value based on the angle
            // final newValue = (angle / (2 * pi)) * 100.0;
            final normalizedValue = angle / (2 * pi);
            final newValue = (normalizedValue * 300).clamp(0.0, 300.0);
            _updateSliderValue(newValue);

            // _updateSliderValue(newValue.clamp(0.0, 100.0));
            print(newValue);
          },
          child: CustomPaint(
            painter: CircleSliderPainter(
              sliderValue: _sliderValue / 100.0,
              dotRadius: 8.0,
            ),
            child: Container(),
          ),
        ),
        Positioned(
          top: Globals.getDeviceHeight(context) * 0.13,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Weight (lbs)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                _sliderValue.toStringAsFixed(1), // Display one decimal place
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
