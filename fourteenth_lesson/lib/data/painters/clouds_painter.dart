import 'package:flutter/material.dart';

class CloudsPainter extends CustomPainter {
  final Color cloudsColor;

  CloudsPainter(this.cloudsColor);
  @override
  void paint(Canvas canvas, Size size) {
    final cloudsPainter = Paint();
    cloudsPainter.color = cloudsColor;
    cloudsPainter.style = PaintingStyle.fill;

    canvas.drawCircle(const Offset(200, 200), 55, cloudsPainter);
    canvas.drawCircle(const Offset(140, 200), 45, cloudsPainter);
    canvas.drawCircle(const Offset(260, 200), 50, cloudsPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
