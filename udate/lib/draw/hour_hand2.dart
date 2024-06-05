import 'dart:math';
import 'package:flutter/material.dart';


class HourHand2Painter extends CustomPainter{
  final Paint hourHandPaint;
  double tm;

  HourHand2Painter({required this.tm}):hourHandPaint= Paint(){
    hourHandPaint.color= Colors.black45;
    hourHandPaint.style= PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width/2;
    // To draw hour hand
    canvas.save();
    canvas.translate(radius, radius);

    //checks if hour is greater than 12 before calculating rotation
    canvas.rotate( 2*pi*(tm*10%1));


    Path path= Path();

    //heart shape head for the hour hand
   /* path.moveTo(0.0, -radius+15.0);
    path.quadraticBezierTo(-3.5, -radius + 25.0, -15.0, -radius+radius/4);
    path.quadraticBezierTo(-20.0, -radius+radius/3, -7.5, -radius+radius/3);
    path.lineTo(0.0, -radius+radius/4);
    path.lineTo(7.5, -radius+radius/3);
    path.quadraticBezierTo(20.0, -radius+radius/3, 15.0, -radius+radius/4);
    path.quadraticBezierTo(3.5, -radius + 25.0, 0.0, -radius+15.0);*/


    //hour hand stem
    path.moveTo(-1.0, -20-radius+radius/4);
    path.lineTo(-7.0, -10-radius+radius/2);
    path.lineTo(-4.0, 0.0);
    path.lineTo(4.0, 0.0);
    path.lineTo(7.0, -10-radius+radius/2);
    path.lineTo(1.0, -20-radius+radius/4);
    path.close();

    canvas.drawPath(path, hourHandPaint);
    canvas.drawShadow(path, Colors.black, 2.0, false);


    canvas.restore();

  }

  @override
  bool shouldRepaint(HourHand2Painter oldDelegate) {
    return true;
  }
}