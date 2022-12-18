import 'package:flutter/material.dart';

class WaterPainter extends CustomPainter {
  final Color waterColor;

  WaterPainter(this.waterColor);
  @override
  void paint(Canvas canvas, Size size) {
    final waterPainter = Paint();
    waterPainter.color = waterColor;
    waterPainter.style = PaintingStyle.fill;
    waterPainter.strokeWidth = 6;
    canvas.drawLine(
        const Offset(140, 260), const Offset(110, 300), waterPainter);
    canvas.drawLine(
        const Offset(210, 260), const Offset(180, 300), waterPainter);
    canvas.drawLine(
        const Offset(280, 260), const Offset(250, 300), waterPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
