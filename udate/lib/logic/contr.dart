import 'dart:async';
import 'package:get/get.dart';
import 'package:UDATE/logic/class.dart';
import 'package:UDATE/logic/time.dart';

class Ctr extends GetxController{
  var utc = UTC(DateTime.now()).obs;
  var udat = UDAT().obs;
  int i=0;
  int syn=0;
  var secOn=false.obs;
  Timer? _timer;

  @override
  void onInit() {
    udat.value.init();
    //final Timer _timer =
    _timer = Timer.periodic(const Duration(milliseconds: 87), (_) {_addTime();});
    super.onInit();
  }

  _addTime(){
    i=i+1;
    udat.value.upd(uchrons: 1);
    if(i==11){
      if(syn==30){
        sync();
        return null;
      }else {
        syn = syn+1;
          utc.value.now=utc.value.now.add(const Duration(seconds: 1));
        i = 0;
      }
    utc.update((val) { });
    }
    udat.update((val) { });
  }

  secondHand(bool sec){
    if(sec){
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(milliseconds: 87), (_) {_addTime();});
      secOn.value=true;
    }else{
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {sync();});
      secOn.value=false;
    }
  }

  sync(){
    double chrnnm = getUdat(DateTime.now()); //2023.365:99:99:99
    udat.value.chronnium = 4543000000+chrnnm.floor();
    udat.value.chronD= (chrnnm-chrnnm.floor())*1000;
    utc.value.update();
    i=0;
    syn=0;
    utc.update((val) { });
    udat.value.upd();
    udat.update((val) { });
  }
  }