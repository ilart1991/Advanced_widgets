import 'package:flutter/material.dart';

class SunPainter extends CustomPainter {
  final Color sunColor;

  SunPainter(this.sunColor);
  @override
  void paint(Canvas canvas, Size size) {
    final sunPainter = Paint();
    sunPainter.color = sunColor;
    sunPainter.style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(210, 150), 60, sunPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
