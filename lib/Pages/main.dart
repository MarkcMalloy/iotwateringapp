import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:iotwateringapp/Pages/MyPlants/my_plants_page.dart';
import 'package:iotwateringapp/Pages/connect_to_device_page.dart';
import 'package:iotwateringapp/Pages/tabbar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Visibility(
          visible: isConnected,
          child: TabbarPage(),
          replacement: TabbarPage(),
        ));
  }
}
