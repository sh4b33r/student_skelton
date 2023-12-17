import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_app/view/add/add_screen.dart';
import 'package:get_app/view/home/widgets/custom_grid.dart';

import 'widgets/search.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("title"),
        ),

        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 47, 37, 1),
          child: Icon(Icons.add,color: Colors.white,),
            onPressed: () {
              Get.to(() => AddScreen());
            }),

            
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomSearchBar(),
           Expanded(
             child: Column(
                 
                  children: [
                     Expanded(
                       child: CustomGridview()
                     )
                    
                    
                    
                    
                    ],
                
              ),
           ),
          ],
        ));
  }
}




   