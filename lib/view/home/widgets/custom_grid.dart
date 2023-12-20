import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controller/controller_main.dart';
import 'package:get_app/view/detailed_view/detailed_view.dart';
import 'package:get_app/view/edit/edit_screen.dart';

class CustomGridview extends StatelessWidget {
  CustomGridview({super.key});
  final controller = Get.find<MyGXController>();
  @override
  Widget build(BuildContext context) {
    return GetX<MyGXController>(
      builder: (controller) {
        return controller.studentListNot.isEmpty?Center(child: Text("No data",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),):
        
        
         GridView.count(
          crossAxisCount: 2,
          children: List.generate(controller.studentListNot.length, (index) {
            final data = controller.studentListNot[index];
            return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() =>  DetailedView(value: data));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 166, 221, 177),
                            borderRadius: BorderRadius.circular(5)),
                        height: 30,
                        width: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            data.photo.isNotEmpty
                                ? Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CircleAvatar(
                                      backgroundImage:
                                          FileImage(File(data.photo)),
                                    radius: 43,
                                    ),
                                )
                                : const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 35,
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                data.name,
                                style: const TextStyle(fontWeight: FontWeight.w800),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {

                                      Get.to(()=>EditScreen(id: data.id, name: data.name, place: data.place, std: data.std, age:data.age, photo: data.photo));
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,color: Colors.red),
                                    onPressed: () {
Get.dialog(
    AlertDialog(

      title: const Text('Are You Sure ?'),
      content: const Text("Deleted items can't  be Retrieved"),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () => Get.back(),
        ),
         TextButton(
          child: const Text("Delete",style: TextStyle(color: Colors.red),),
          onPressed: () {
controller.deleteData(data.id);

 Get.back();
          },
        ),
      ],
    ),
  );



                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          }),
        );
      },
      // child:
    );
  }
}
