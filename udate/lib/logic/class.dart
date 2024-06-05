import 'dart:core';

import 'package:UDATE/logic/time.dart';

class Pages{
  static String home ="/";
  static String calendar ="/calendar";
  static String convert ="/convert";



}

class Chron {
  late double chronD; //days.hours minute seconds
  late int chron;     // whole number days
  late int centiChron;// whole number hours
  late int miniChron;// whole number minutes
  late int uChron;//whole number seconds

  late String chronS; //String
  late String centiChronS;
  late String miniChronS;
  late String uChronS;


  Chron(this.chronD):
    chron = chronD.floor();

  init(){
    _updateStrings();
  }
  _updateStrings(){
    chron=chronD.floor();
    centiChron=((chronD%1)*100).floor();
    miniChron=(((chronD*100)%1)*100).floor();
    uChron=(((chronD*100*100)%1)*100).floor();

    chronS=int2Str(chron, true);
    centiChronS=int2Str(centiChron, false);
    miniChronS=int2Str(miniChron,false);
    uChronS=int2Str(uChron, false);
  }
}

class UDAT extends Chron{
  int chronnium;
  late String chronniumS;
  late double chronDD;

  UDAT({this.chronnium=0, this.chronDD=0.0}):
        super(chronDD);

  @override
  init() {
    chronnium = 4543000000+(getUdat(DateTime.now()).floor());
    chronniumS = chronnium.toString().substring(chronnium.toString().length-4);
    return super.init();
  }

  upd({int chronniums=0, int chrons=0, int centiChrons=0, int minichrons=0, int uchrons=0}){
   chronnium=chronnium+chronniums;
   chronniumS = chronnium.toString().substring(chronnium.toString().length-4);
   chronD = chronD + chrons + centiChrons/100 + minichrons/10000 + uchrons/1000000;
   _updateStrings();
  }

}

class UTC{
  DateTime now;
  UTC(this.now);

  String get date{
    return now.year.toString()+"-"+int2Str(now.month, false)+"-"+int2Str(now.day,false);
  }
  String get hour{return int2Str(now.hour, false);}
  String get minute{return int2Str(now.minute, false);}
  String get second{return int2Str(now.second, false);}
  String get string{return date+" "+hour+':'+minute+':'+second;}
  String get stringNoSec{return date+" "+hour+':'+minute;}

  update(){
    now = DateTime.now();
  }

}

//----------- Functions-----------------

String int2Str(int num, bool pl3){
  String ret=num.toString();
  if(pl3 && num<100){ret="0"+ret;}
  if(num<10){ret="0"+ret;}
  return ret;
}