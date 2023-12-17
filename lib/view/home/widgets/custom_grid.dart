import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/view/detailed_view/detailed_view.dart';

class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key});

  @override
  Widget build(BuildContext context) {
    
  return GridView.count(
      crossAxisCount: 2,
      
      children: List.generate(100, (index) {
        // final data = studentList[index];

        // ignore: unnecessary_null_comparison
        // Widget imageWidget = data.imageData != null
        //     ? ClipOval(
        //         child: Image.memory(
        //           data.imageData,
        //           fit: BoxFit.cover,
        //           width: 50, 
        //           height: 50, 
        //         ),
        //       )
        //     : Container();


        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Get.to(()=> DetailedView()
            
            );},
            child: Container(
              decoration: BoxDecoration( color: Colors.amber,borderRadius: BorderRadius.circular(5)),
              height: 30,
              width: 40,
             
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            
            
              const CircleAvatar(backgroundColor: Colors.red,radius: 35,)
              
              ,Text("Name $index"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [IconButton(
                  icon: const Icon( Icons.edit),
            
                  onPressed: (){},
                 ),
                
                IconButton(
                  icon: const Icon( Icons.delete),
            
                  onPressed: (){},
                 )
                ],),
              )
            
            ],),
              
            
            ),
          ),
        );
      }),
    );


    }
  }

