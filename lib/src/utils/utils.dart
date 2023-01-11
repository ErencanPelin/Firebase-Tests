import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils{
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static final DateFormat formatter = DateFormat('dd/MM/yyyy');
  static final days = <String>['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

  static showSnackBar(String? text, Color col){
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text), backgroundColor: col,);

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static String formattedDate(DateTime date) => formatter.format(date);

  static String getDay(int day) => days[day];
}