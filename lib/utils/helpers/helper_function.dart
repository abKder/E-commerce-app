import 'package:flutter/material.dart';

class AHelperFunctions{
  AHelperFunctions._();

  static bool inDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if(value == 'Dark Blue'){
      return Colors.blueGrey;
    }
    else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else if(value == 'Silver') {
      return Colors.grey;
    }else {
      return null;
    }
  }

  static String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) { // 5AM to 12PM
      return 'Good Morning';
    } else if (hour >= 12 && hour < 16) { // 12PM to 4PM
      return 'Good Afternoon';
    } else if (hour >= 16 && hour < 19) { // 5PM to 7PM
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
}