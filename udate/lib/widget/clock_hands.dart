import 'package:flutter/material.dart';
import '../draw/hour_hand1.dart';
import '../draw/hour_hand2.dart';
import '../draw/minute_hand.dart';
import '../draw/second_hand.dart';
import '../logic/contr.dart';
import 'package:get/get.dart';


/*
class ClockHands extends StatefulWidget {
  const ClockHands({Key? key}) : super(key: key);

  @override
  _ClockHandState createState() => _ClockHandState();
}*/

class ClockHands extends StatelessWidget {
  ClockHands({Key? key}) : super(key: key);
  final Ctr ctr = Get.find();


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.0,
        child: Container(
            width: Get.width,
            height: Get.height*0.5,
            padding: const EdgeInsets.all(20.0),
            child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Obx(()=>CustomPaint( painter: HourHandPainter(
                      tm: (ctr.udat.value.chronD),
                  ),),),
                   Obx(()=>CustomPaint(painter: HourHand2Painter(
                        tm: (ctr.udat.value.chronD),
                      ),),),
                  Obx(()=>CustomPaint( painter: MinuteHandPainter(
                    tm: (ctr.udat.value.chronD),
                  ),),),
                  Obx(()=>ctr.secOn.value?CustomPaint( painter: SecondHandPainter(
                    tm: (ctr.udat.value.chronD),
                  ),):Container(),),
                ]
            )
        )

    );
  }
}