
double getUdat(DateTime now) {
  //final now = DateTime.now();
  final DateTime startDate = DateTime(2021, 3, 1); // Starting date
  double chron = now // Gregorian date
      .difference(startDate) //calculate the difference
      .inDays                //in days
      .toDouble();           // Show numbers after the point
  chron = chron + 0.041666; //add 5 hours to 5am
  final int chronD = chron.floor(); //How many full days past
  const int daysIn20Years = (365*19) + 370; // 7305 days
  final int leap = (chronD~/daysIn20Years);// .floor(); //Counts how many leap years
  int remY = (chronD-leap*370)~/365; //.floor(); //remained years

  double chronsInY = (chronD - (370*leap) - (365*remY)).toDouble(); //chrons past in this year
  if ((remY%20)==0) { //remainder=0 means right now it's a leap year
    remY = remY-1;
    chronsInY = chronsInY + 365;
  }
  int chronnium = remY + (20*leap);
  chronsInY = chronsInY + ((now.hour - 5) / 24 + (now.minute / 60 / 24) +
      now.second / 60 / 60 / 24);
  chronsInY = double.parse(chronsInY.toStringAsFixed(6));
  double chronniumD = 2021+chronnium + chronsInY/1000;


/*
  int chronnium = chron ~/ 365;
  chron = chron - (chronnium * 365) - 1; //day zero
  chronnium = chronnium + 21;
  chron = chron + ((now.hour - 5) / 24 + (now.minute / 60 / 24) +
      now.second / 60 / 60 / 24);
  chron = double.parse(chron.toStringAsFixed(6));
  */
  return (chronniumD);
}


String pdLeft(String str){
  return (str.padLeft(2, "0"));
}