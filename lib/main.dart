import 'package:flutter/material.dart';
import 'package:untitled1/Modules/OnBoarding%20Screen.dart';
import 'package:untitled1/Modules/Shop_Layout/Shop-Lyout.dart';
import 'package:untitled1/network/local/cache_helper.dart';
import 'package:untitled1/network/remote/dio_helper.dart';

import 'Modules/Login Screen/Login Screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget? widget;

  bool? onBoarding = CacheHelper.getdata(key: 'onBoarding');
  dynamic token = CacheHelper.getdata(key: 'token');
  if(onBoarding != null){
    if(token != null) widget = ShopLayout();
    else  widget = ShopLogin();

  }else{
    widget = OnBoarding();
  }
  runApp( MyApp(startWidget: widget));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: startWidget,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        ),
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}


