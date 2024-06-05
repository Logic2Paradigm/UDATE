import 'dart:math';

import 'package:flutter/material.dart';



class SecondHandPainter extends CustomPainter{
  final Paint secondHandPaint;
  final Paint secondHandPointsPaint;

  double tm;

  SecondHandPainter({required this.tm}):
        secondHandPaint= Paint(),
        secondHandPointsPaint= Paint(){
    secondHandPaint.color= Colors.yellow;
    secondHandPaint.style= PaintingStyle.stroke;
    secondHandPaint.strokeWidth= 4.0;

    secondHandPointsPaint.color=Colors.red;
    secondHandPointsPaint.style= PaintingStyle.fill;

  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius= size.width/2;
    canvas.save();

    canvas.translate(radius, radius);


    canvas.rotate(2*pi*(tm*10000%1));

    Path path1= Path();
    Path path2 = Path();
    path1.moveTo(0.0, -radius/3 );
    path1.lineTo(0.0, radius/15);

    path2.addOval(Rect.fromCircle(radius: 3.0, center: Offset(0.0, -radius-10)));
    //path2.addOval(Rect.fromCircle(radius: 5.0, center: const Offset(0.0, 0.0)));




    canvas.drawPath(path1, secondHandPaint);
    canvas.drawPath(path2, secondHandPointsPaint);


    canvas.restore();
  }

  @override
  bool shouldRepaint(SecondHandPainter oldDelegate) {
    return tm != oldDelegate.tm;
  }
}