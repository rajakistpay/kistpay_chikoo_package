import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9954099, 0);
    path_0.lineTo(size.width * 0.03211006, size.height * 0.3207538);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.9954099, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff3566EB).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    String text = 'Digital Future';
    TextSpan textSpan = TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
    );

    TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);
    double dx = (size.width - textPainter.width) / 2;
    double dy = (size.height - textPainter.height) / 2;
    Offset textOffset = Offset(dx, dy);

    canvas.translate(textOffset.dx, textOffset.dy);
    textPainter.paint(canvas, const Offset(0, 10));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
