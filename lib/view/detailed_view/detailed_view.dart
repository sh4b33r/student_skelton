import 'package:flutter/material.dart';

class DetailedView extends StatelessWidget {
  const DetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.amber,),
      
      body: ListView(
        children: [
          Padding(
            
            padding: const EdgeInsets.all(40.0),
            child: Container(
              color: Color.fromARGB(255, 205, 193, 91),
              height: 600,
              width: 500,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50,),
                    // imageProfileWidgetc,
                    CircleAvatar(backgroundColor: Colors.black,radius: 40,),
                    const SizedBox(height: 50,),
                    Text(
                      'Name : name',
                      style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      'Age : age',
                      style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      'Place : place',
                      style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15,),
                    Text(
                      'Standard : std',
                      style: const TextStyle(fontSize: 30,fontFamily: 'Raleway-VariableFont_wght',fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}