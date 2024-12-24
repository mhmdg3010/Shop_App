import 'package:flutter/material.dart';
import 'package:untitled1/Components/components.dart';
import 'package:untitled1/Modules/Login%20Screen/Login%20Screen.dart';

import '../../network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salla',style: TextStyle(color: Colors.green),),
      ),
      body: TextButton(
        onPressed: (){
          CacheHelper.removeData(key: 'token').then((value) {
            navigateAndfinish(context, ShopLogin());
          });
        },
        child: Icon(Icons.logout_outlined),
      ),
    );
  }
}
