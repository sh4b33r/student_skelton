import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controller/controller_main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(MyGXController());

     MyGXController().navigation();
   
    return Scaffold(
      body: Stack(

        
        fit: StackFit.expand,
        alignment: 
        Alignment.bottomCenter,
        children:<Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/games.png',
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
