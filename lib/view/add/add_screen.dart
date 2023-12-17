import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controller/controller_main.dart';
import 'package:get_app/model/model.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _ageCont = TextEditingController();
  final TextEditingController _stdCont = TextEditingController();
  final TextEditingController _placeCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final MyGXController controller = Get.put(MyGXController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 20, right: 30, bottom: 40),
        child: Container(
          height: 700,

          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(3, 5),
                blurRadius: 40,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 158, 158, 158),
          ),
          // color: const Color.fromARGB(255, 162, 162, 162),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.all(20.0),
                  //   child: Text(
                  //     'Add a Student Record',
                  //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _nameCont,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      // validator: _emptyValidator,
                      onChanged: (value) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value) {
                        
  if (value == null || !RegExp(r"^[a-zA-Z][a-zA-Z\- ]{2,28}$").hasMatch(value.trim())) {
  return "Enter a Valid name";
} else {
  return null;
}
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _ageCont,
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _formKey.currentState!.validate();
                      },
                      // validator: _emptyValidator,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a Valid age ";
                        } else if (!RegExp(r"^([4-9]|1[0-9]|2[0-5])$")
                            .hasMatch(value)) {
                          return "Enter age Between 4 and 25";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _stdCont,
                      decoration: const InputDecoration(
                        labelText: 'Standard',
                        border: OutlineInputBorder(),
                      ),
                        onChanged: (value) {
                        _formKey.currentState!.validate();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a Valid standard ";
                        } else if (!RegExp(r"^([1-9]|1[0-2])$")
                            .hasMatch(value)) {
                          return "Enter a Standard Below 12";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _placeCont,
                      decoration: const InputDecoration(
                        labelText: 'Place',
                        border: OutlineInputBorder(),
                      ),
                        onChanged: (value) {
                        _formKey.currentState!.validate();
                      },
                      // validator: _emptyValidator,
                      validator: (value) {
                        if (value == null ||
                            !RegExp(r"^[a-zA-Z0-9\- ]{1,20}$")
                                .hasMatch(value)) {
                          return "Enter a Valid Place ";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: () async {
                      await controller.pickImage();
                    },
                    icon: const Icon(Icons.image),
                    label: const Text('Select a Profile Photo'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GetBuilder<MyGXController>(
                    builder: (controller) {
                      return SizedBox(
                        width: 100,
                        height: 100,
                        child: controller.image.isNotEmpty
                            ? Image.file(File(controller.image))
                            : const Text(
                                'Please Select An Image From Gallery',
                                textAlign: TextAlign.center,
                              ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() &&
                          controller.image.isNotEmpty) {
                        await addSTd();
                        Get.snackbar(
                          'Success',
                          "Student Data Added",
                          // colorText: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 4, 178, 91),
                          icon: const Icon(Icons.done),
                        );
                        clear();
                      } else if (controller.image.isEmpty) {
                        Get.snackbar(
                          "Image Not Found",
                          "Pleae try to add Image",
                          backgroundColor: Colors.red,
                          icon: Icon(Icons.image_not_supported_outlined,
                              color: Colors.white),
                          colorText: Colors.white,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Student Added Succesfully'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                          ),
                        );

                        // }else{
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                        //    Text('Please Enter All Fields',

                        //    )));
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  addSTd() async {

  final studenetdetails = StudentModel(
        name: _nameCont.text,
        age: _ageCont.text,
        photo: controller.image,
        std: _stdCont.text);

    await controller.addStudents(studenetdetails);
  }

  clear() {
    _nameCont.clear();
    _ageCont.clear();
    _placeCont.clear();
    _stdCont.clear();
    controller.image = '';
    controller.update();
  }
}
