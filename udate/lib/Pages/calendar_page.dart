import 'package:flutter/material.dart';
import 'package:UDATE/logic/contr.dart';
import 'package:get/get.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);
/*  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {*/
  @override
  Widget build(BuildContext context) {
    final Ctr ctr = Get.find();
    int days = ctr.udat.value.chron;
    int month = (days/100).floor();
    int week = (days-100*month);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){Get.back();},
              icon: const Icon(Icons.arrow_back)),
          title:
              const Text('UDAT - Calendar')
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
                const Text(
                  'Hectochron #0 - Nullmon (spring)'
                ),
                tableMonth(month: month==0?true:false,weeks: week),
                const SizedBox(height: 5,),
              const Text(
                  'Hectochron #1 - Primomon (summer)'
              ),
                tableMonth(month: month==1?true:false,weeks: week),
                const SizedBox(height: 5,),
              const Text(
                  'Hectochron #2 - Secunmon (fall)'
              ),
                tableMonth(month: month==2?true:false,weeks: week),
                const SizedBox(height: 5,),
              const Text(
                  'Hectochron #3 - Tetromon (winter)'
              ),
                tableMonth(month: month==3?true:false,weeks: week, last: true),
        ]),
          ),
        ),
      ),
    );
  }
}


TableRow calendarRow(String weekName, {int today=15,int days=10, int weekNo=0}) {
  List<Widget> col=[];
  for(int i = 0; i<11; i++){
    col.add(Container(
      color: i==today+1?Colors.red:Colors.white,
      child: Center(child:
        Text(
          i==0?weekName: i<=days?(i-1+weekNo*10).toString():"",
          style: TextStyle(color: i==today+1?Colors.white:Colors.black, fontWeight: i==0?FontWeight.bold:FontWeight.normal),
          textScaleFactor: i==0?0.6:1,
        )
      ),
    ));
  }
  return TableRow(children: col);
}

TableRow firstRow({int start=0, int days=11}) {
  List<Widget> col=[];
  List<String> dayName=[ "Decachron"  ,"Nullday",    "Primoday",
    "Secunday",    "Tetroday",    "Quatroday",    "Quintoday",
    "Sextoday",    "Septoday",    "Octaday",	"Nonday"];
  for(int i = start; i<start+11; i++){
    col.add(Center(child:
    Text(
      dayName[i],
      style: const TextStyle(
          color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    )
    ));
  }
  return TableRow(children: col);
}

List<TableRow> calendarMonth({bool month=false, bool last=false, int weeks=12}) {
  int week = (weeks/10).floor();
  int day = weeks-10*week;
  List<String> weekName=[
    'Nullweek', 'Primoweek', 'Secunweek',
    'Tetroweek', 'Quatroweek', 'Quintoweek',
    'Sextoweek', 'Septoweek', 'Octaweek',
    'Nonweek',
  ];
  int ln;
  last?ln=7:ln=10;
  List<TableRow> calendarMonth=[];
  calendarMonth.add(firstRow());
  for(int i = 0; i<ln; i++){
    calendarMonth.add(calendarRow(
        weekName[i],
        weekNo: i,
        days: last? i==6?5:10 :10,
        today: month && i==week? day:30
    ));
  }
  return calendarMonth;
}

Widget tableMonth({bool month=false, bool last=false, int weeks=12}){

  return Container(
    margin: const EdgeInsets.all(10),
    child: Table(
      //defaultColumnWidth: const FixedColumnWidth(120.0),
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 1),
      children:
      calendarMonth(last: last, weeks: weeks, month: month),
    ),
  );
}
