import 'package:flutter/material.dart';
import 'package:untitled1/Modules/OnBoarding%20Screen.dart';
import 'package:untitled1/network/local/cache_helper.dart';
import 'package:untitled1/network/remote/dio_helper.dart';

import 'Modules/Login Screen/Login Screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  runApp( MyApp(onBoarding: onBoarding));
}

class MyApp extends StatelessWidget {
  final bool? onBoarding;
  const MyApp({this.onBoarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: onBoarding! ? ShopLogin():OnBoarding(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        ),
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}


