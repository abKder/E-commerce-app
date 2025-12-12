import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AHelperFunctions {
  AHelperFunctions._();

  static bool inDarkMode(BuildContext context) {
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
    } else if (value == 'Dark Blue') {
      return Colors.blueGrey;
    } else if (value == 'Pink') {
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
    } else if (value == 'Silver') {
      return Colors.grey;
    } else {
      return null;
    }
  }

  static String getGreetingMessage() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      // 5AM to 12PM
      return 'Good Morning';
    } else if (hour >= 12 && hour < 16) {
      // 12PM to 4PM
      return 'Good Afternoon';
    } else if (hour >= 16 && hour < 19) {
      // 5PM to 7PM
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

//function asset to file
  static Future<File> assetToFile(String assetPath) async {
    //load asset
    final byteData = await rootBundle.load(assetPath);

    //get temporary directory
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${assetPath.split('/').last}');

    //write bytes to temporary file
    await file.writeAsBytes(byteData.buffer.asUint8List());

    return file;
  }
}
