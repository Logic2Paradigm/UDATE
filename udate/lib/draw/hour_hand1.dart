import 'dart:math';
import 'package:flutter/material.dart';


class HourHandPainter extends CustomPainter{
  final Paint hourHandPaint;
  double tm;

  HourHandPainter({required this.tm}):hourHandPaint= Paint(){
    hourHandPaint.color= Colors.black87;
    hourHandPaint.style= PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width/2;
    // To draw hour hand
    canvas.save();
    canvas.translate(radius, radius);

    //checks if hour is greater than 12 before calculating rotation
    canvas.rotate( 2*pi*(tm) );


    Path path= Path();

    //hour hand stem
    path.moveTo(-1.0, -radius+radius/4);
    path.lineTo(-10.0, 10-radius+radius/2);
    path.lineTo(-5.0, 0.0);
    path.lineTo(5.0, 0.0);
    path.lineTo(10.0, 10-radius+radius/2);
    path.lineTo(1.0, -radius+radius/4);
    path.close();

    canvas.drawPath(path, hourHandPaint);
    canvas.drawShadow(path, Colors.black, 2.0, false);

    canvas.restore();
  }

  @override
  bool shouldRepaint(HourHandPainter oldDelegate) {
    return true;
  }
}