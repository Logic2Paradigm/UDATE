import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UDATE/logic/contr.dart';

options (){
  //var sw=true.obs;
  Ctr ctr = Get.find();
    Get.defaultDialog(
      title: 'Options',
      radius: 30,
      textConfirm: 'OK',
      onConfirm: (){Get.back();},
      content: Column(
        children: [
          ListTile(
              leading: const Icon(Icons.timer_10),
              onTap: (){ctr.secondHand(!ctr.secOn.value);},
              title: const Text('Second hand'),
              trailing: Obx(()=>Switch(
                value: ctr.secOn.value,
                onChanged: (value){
                  //ctr.secOn.value=value;
                  ctr.secondHand(value);
                },
              ), )//
          ),
        ],
      )
    );
}