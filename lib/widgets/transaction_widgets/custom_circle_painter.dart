import 'package:flutter/material.dart';

class CustomCirclePainter extends CustomPainter {
  final Color color;
  const CustomCirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        Offset(size.width / 4, size.height / 3),
        size.height / 1.8,
        Paint()
          ..style = PaintingStyle.fill
          ..color = color
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}