import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({Key? key}) : super(key: key);

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  var minutes = "01".obs;
  var hours = "01".obs;
  var days = "001".obs;
  var secondsU = "00".obs;
  var minutesU = "00".obs;
  var hoursU = "20".obs;
  var daysU = "01".obs;
  var monthsU = "01".obs;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back)),
          title: const Text('Conversion'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 20,),
              const Text('Under',style: TextStyle(fontSize: 50,color: Colors.red)),
              const Text('Construction',style: TextStyle(fontSize: 50,color: Colors.red)),
              const Text('UDAT',style: TextStyle(fontSize: 40)),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: const [
                Text('          Year  /   Day   .   Hour   :   Minute :')
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: const [
                Text('Chronnium/Chron.Centichron:Minichron:')
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('2022 /', style: TextStyle(fontSize: 25),),
                  Obx(()=>
                  dropDown(
                      makeList(364, 3),
                      days
                  )),
                  const Text('.',style: TextStyle(fontSize: 25)),
                  Obx(()=>
                      dropDown(
                          makeList(99, 2),
                          hours,
                      )),
                  const Text(':',style: TextStyle(fontSize: 25)),
                  Obx(()=>
                      dropDown(
                        makeList(99, 2),
                        minutes,
                      )),
                  const Text(':',style: TextStyle(fontSize: 25)),
                ],),
              //Container(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(icon: const Icon(Icons.arrow_downward),onPressed: (){}),
                Container(width: 35,),
                IconButton(icon: const Icon(Icons.arrow_upward),onPressed: (){}),
              ]),
              Container(height: 10,),
              // Gregorian + U T C
              const Text('Gregorian + UTC',style: TextStyle(fontSize: 40)),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: const [
                Text('           Year / Month / Day           Hour : Minute : Second')
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('2022 /', style: TextStyle(fontSize: 25),),
                  Obx(()=>
                      dropDown(
                          makeList(12, 2,zero: false),
                          monthsU
                      )),
                  const Text('/',style: TextStyle(fontSize: 25)),
                  Obx(()=>
                      dropDown(
                        makeList(31, 2,zero: false),
                        daysU,
                      )),
                  Container(width: 20,),
                  Obx(()=>
                      dropDown(
                        makeList(23, 2),
                        hoursU,
                      )),
                  const Text(':',style: TextStyle(fontSize: 25)),
                  Obx(()=>
                      dropDown(
                        makeList(59, 2),
                        minutesU,
                      )),
                  const Text(':',style: TextStyle(fontSize: 25)),
                  Obx(()=>
                      dropDown(
                        makeList(59, 2),
                        secondsU,
                      )),
                ],),
            ],
          ),
        )
         /* DropdownButton<String>(
          value: hours,
            icon: const Icon(Icons.arrow_downward),
            elevation: 25,
            items:['1','2','3','4','5','6','7',
              '8','9','10','11','12']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
              }).toList(),
            onChanged: (String? newValue){
            setState(() {
              hours=newValue!;
            });
            }
        ),*/
      ),
    );
  }
}

dropDown(List<String> items, var value){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: DropdownButton<String>(
        isDense: false,
        value: value.value,
        iconSize: 2.0,
        //icon: Icon(icon),
        elevation: 25,
        items:items
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value.toString(),style: const TextStyle(fontSize: 25)),
          );
        }).toList(),
        onChanged: (String? newValue){
            value.value=newValue!;
        }
    ),
  );
}

List<String> makeList(int num, int howMuch,{bool zero=true}){
  List<String> l=[];
  String add='';
  for(int i=zero?0:1;i<=num;i++){
    add=i.toString();
    while(howMuch>add.length){
      add='0$add';
    }
    l.add(add);
  }
  return l;
}