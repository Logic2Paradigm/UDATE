import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UDATE/Pages/options_dialog.dart';
import 'package:UDATE/logic/class.dart';
import 'package:UDATE/widget/url.dart';


Widget draw(){
  return Drawer(
    child: ListView(
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Text("Menu",
                style: TextStyle(color: Colors.white,fontSize: 25),
              ),
            )
        ),
        lTile('Calendar', Icons.calendar_month, (){Get.back(); Get.toNamed(Pages.calendar);},(){}), //
        lTile('Convert', Icons.compare_arrows, (){Get.back(); Get.toNamed(Pages.convert);},(){}),
        lTile('Timestamp Format', Icons.timer_10_select_sharp, (){Get.back(); launchURL(example: true);},(){}),
        lTile('Options', Icons.settings, (){Get.back(); options();},(){}),
      ],
    ),
  );
}

Widget lTile(String text, IconData icon, Function() onPress,Function() longPress){
  return ListTile(
    leading: Icon(icon),
    title: Center(
      child: Text(text,
        style: const TextStyle(fontSize: 18),
      ),
    ),
    onTap: onPress,
    onLongPress: longPress,
  );
}
