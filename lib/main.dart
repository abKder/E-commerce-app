import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'my_App.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //flutter native splash
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //portrait up the device
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

