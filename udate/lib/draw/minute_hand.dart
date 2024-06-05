import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MinuteHandPainter extends CustomPainter{
  final Paint minuteHandPaint;
  double tm;
  late Size wid;


  MinuteHandPainter({required this.tm}):minuteHandPaint= Paint(){
    minuteHandPaint.color= Colors.red;
    minuteHandPaint.style= PaintingStyle.fill;

  }

  @override
  void paint(Canvas canvas, Size size) {
    if(Get.width<Get.height*0.5){
      wid=Size(Get.width,Get.width);
    }else{
      wid=Size(Get.height,Get.height);
    }
    final radius= size.width/2;
    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(2*pi*((tm*10000).floor()/100%1));

    Path path= Path();
    Path path2 = Path();
    path.moveTo(-0.5, -radius-10.0);
    path.lineTo(-2.0, -radius/1.8);
    path.lineTo(-2.0, 10.0);
    path.lineTo(2.0, 10.0);
    path.lineTo(2.0, -radius/1.8);
    path.lineTo(0.5, -radius-10.0);
    path.close();
    path2.addOval(Rect.fromCircle(radius: 7.0, center: const Offset(0.0, 0.0)));

    canvas.drawPath(path, minuteHandPaint);
    canvas.drawPath(path2, minuteHandPaint);
    canvas.drawShadow(path, Colors.black, 4.0, false);


    canvas.restore();

  }

  @override
  bool shouldRepaint(MinuteHandPainter oldDelegate) {
    return true;
  }
}