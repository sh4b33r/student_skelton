import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controller/controller_main.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(MyGXController());
  @override
  Widget build(BuildContext context) {
    MyGXController().navigation();
    MyGXController().studentsRefresh();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/loading-loading-forever.gif',
                height: 50,
                width: 50,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Loading.....")
            ],
          ),
        ],
      ),
    );
  }
}
