import 'package:flutter/material.dart';
import 'package:UDATE/draw/clock_body_painter.dart';
import 'clock_hands.dart';


class ClockBody extends StatelessWidget{
  const ClockBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(20.0),
      child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: CustomPaint(
                    painter: ClockDialPainter(clockText: ClockText.arabic),
                  ),
                ),
               /* Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black
                    ),) ,),*/
                Stack(
                  fit: StackFit.expand,
                  children: [ClockHands()],
                )
              ]
          )
      )
    );
  }
}