import 'package:flutter/material.dart';
import 'package:untitled1/Modules/OnBoarding%20Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoarding(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        ),
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}


