import 'package:flutter/material.dart';
import 'dart:math';

class CircularSlider extends StatefulWidget {
  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  double _angle = 0.0; // Current angle of the slider

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.orange, width: 5.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: CircularSliderPainter(_angle),
            ),
            Positioned(
              left: 100 + 100 * cos(_angle),
              top: 100 + 100 * sin(_angle),
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    double dx = details.localPosition.dx - 100;
                    double dy = details.localPosition.dy - 100;
                    _angle = atan2(dy, dx);
                  });
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularSliderPainter extends CustomPainter {
  final double angle;

  CircularSliderPainter(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final startAngle = -pi / 2; // Adjust to start from the top

    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0
      ..strokeCap = StrokeCap.round;

    final endPoint = Offset(
      center.dx + radius * cos(angle),
      center.dy + radius * sin(angle),
    );

    canvas.drawCircle(center, radius, paint);
    canvas.drawLine(center, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
