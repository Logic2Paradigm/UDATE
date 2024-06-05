import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockDialPainter extends CustomPainter{
  final ClockText clockText;
  final hourTickMarkLength= 18.0;
  final halfhourTickMarkLength= 9.0;
  final minuteTickMarkLength = 5.0;

  final hourTickMarkWidth= 3.0;
  final halfhourTickMarkWidth= 2.2;
  final minuteTickMarkWidth = 1.5;



  final Paint tickPaint;
  final TextPainter textPainter;
  late TextStyle textStyle;
  final romanNumeralList= [ 'X','I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'];


  ClockDialPainter({this.clockText= ClockText.roman})
      :tickPaint= Paint(),
        textPainter= TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        textStyle= TextStyle(
          color: Colors.black,
          fontFamily: 'Times New Roman',
          fontSize: Get.width/20,//15.0,
        )
  {
    tickPaint.color= Colors.black;
  }

  @override
  void paint(Canvas canvas, Size size) {

    var tickMarkLength=1.0;
    const angle= 2* pi / 100;
    final radius= size.width/2;
    canvas.save();

    // drawing
    canvas.translate(radius, radius);
    for (var i = 0; i< 100; i++ ) {

      //make the length and stroke of the tick marker longer and thicker depending
      if(i%10==0){
        tickMarkLength = hourTickMarkLength;
        tickPaint.strokeWidth = hourTickMarkWidth;
      }else if(i%5==0){
        tickMarkLength = halfhourTickMarkLength;
        tickPaint.strokeWidth = halfhourTickMarkWidth;
      }else{
        tickMarkLength = minuteTickMarkLength;
        tickPaint.strokeWidth = minuteTickMarkWidth;
      }
      //tickMarkLength = i % 10 == 0 ? hourTickMarkLength: minuteTickMarkLength;
      //tickPaint.strokeWidth= i % 10 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;
      canvas.drawLine(
          Offset(0.0, -radius), Offset(0.0, -radius+tickMarkLength), tickPaint);


      //draw the text
      if (i%10==0){
        canvas.save();
        canvas.translate(0.0, -radius+Get.width/15);//30.0);

        textPainter.text= TextSpan(
          text: clockText==ClockText.roman?
          romanNumeralList[i~/10]
              :'${i == 0 ? 10 : i~/10}'
          ,
          style: textStyle,
        );

        //helps make the text painted vertically
        canvas.rotate(-angle*i);
        textPainter.layout();
        textPainter.paint(canvas, Offset(-(textPainter.width/2), -(textPainter.height/2)));
        canvas.restore();
      }

      canvas.rotate(angle);
    }

    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

enum ClockText{
  roman,
  arabic
}