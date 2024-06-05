import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UDATE/Pages/calendar_page.dart';
import 'package:UDATE/Pages/convert_page.dart';
import 'package:UDATE/logic/class.dart';
import 'package:UDATE/logic/contr.dart';
import 'package:UDATE/logic/time.dart';
import 'package:UDATE/widget/draw.dart';
import 'package:UDATE/widget/url.dart';
import 'widget/clock_body.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final ctr = Get.put(Ctr());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Pages.home,
      getPages: [
        GetPage(name: Pages.home, page: () => MyHomePage(),),
        GetPage(name: Pages.calendar, page: () => const CalendarPage(),),
        GetPage(name: Pages.convert, page: () => const ConvertPage(),),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final Ctr ctr = Get.find();
  double chrD = getUdat(DateTime.now());
  /*final Uri toLaunch =  Uri(
      scheme: 'https',
      host: Pages.host,
      path: Pages.principles,
      fragment: Pages.principlesFragment
  );
  Future<void> _launchUrl() async {
    if (!await launchUrl(toLaunch, mode: LaunchMode.externalApplication,)) {throw 'Could not launch $toLaunch';}
  }
*/

  @override
  Widget build(BuildContext context) {
    ctr.udat.value.chronD=(chrD-(chrD.floor()))*1000;
    return Scaffold(
      drawer: draw(),
      appBar: AppBar(
        title: const Text('UDAT - Unified Date And Time'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Flexible(child: ClockBody()),
              const SizedBox(height: 10.0),
              const Text(
                'UDAT timestamp:',
                style: TextStyle(fontSize: 15),),
              const SizedBox(height: 5.0),
              TextButton(
                  onPressed: (){launchURL(example: true);},
                  child: Obx(() => ctr.secOn.value? Text(
                    ctr.udat.value.chronniumS + '/'
                        + ctr.udat.value.chronS + '.'
                        + ctr.udat.value.centiChronS + ':'
                        + ctr.udat.value.miniChronS + ':'
                        + ctr.udat.value.uChronS,
                    style: const TextStyle(fontSize: 25),
                  ): Text(
                    ctr.udat.value.chronniumS + '/'
                        + ctr.udat.value.chronS + '.'
                        + ctr.udat.value.centiChronS + ':'
                        + ctr.udat.value.miniChronS + ':',
                    style: const TextStyle(fontSize: 25),
                  )),
              ),

              const SizedBox(height: 30.0),
              const Text('UTC date & time:'),
              const SizedBox(height: 5.0),
              TextButton(
                  onPressed: (){launchURL(example: true);},
                  child: Obx(() => ctr.secOn.value? Text(
                          ctr.utc.value.string.toString(),
                          style: const TextStyle(fontSize: 20),
                        ):Text(
                    ctr.utc.value.stringNoSec.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  ),
              ),
              const SizedBox(height: 20.0),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(Pages.calendar);
          //ctr.utc.update((val) {Get.toNamed(Pages.calendar); });
        },
        child: const Icon(Icons.apps),
      ),
    );
  }
}

