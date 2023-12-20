import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controller/controller_main.dart';
import 'package:get_app/model/model.dart';
import 'package:get_app/view/theme/themes.dart';

class EditScreen extends StatelessWidget {
  final String name;
  final String age;
  final String place;
  final String std;
  final String photo;
  final int? id;

  final controller = Get.find<MyGXController>();

  EditScreen(
      {super.key,
      required this.id,
      required this.name,
      required this.place,
      required this.std,
      required this.age,
      required this.photo});

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _agecontroller = TextEditingController();
  final TextEditingController _stdcontroller = TextEditingController();
  final TextEditingController _placecontroller = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _namecontroller.text = name;
    _agecontroller.text = age;
    _stdcontroller.text = std;
    _placecontroller.text = place;
    controller.image.value = photo;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Clr.appbar,
        leading: IconButton(
            onPressed: () {
              controller.image.value= '';
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        // backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Edit Student",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 20, right: 30, bottom: 40),
        child: Container(
          height: 700,

          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(3, 5),
                blurRadius: 40,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 235, 249, 227),
          ),
          // color: const Color.fromARGB(255, 162, 162, 162),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey1,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _namecontroller,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _formKey1.currentState!.validate();
                      },
                      validator: (value) {
                        if (value == null ||
                            !RegExp(r"^[a-zA-Z][a-zA-Z\- ]{2,28}$")
                                .hasMatch(value.trim())) {
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
                      controller: _agecontroller,
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _formKey1.currentState!.validate();
                      },
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
                      controller: _stdcontroller,
                      decoration: const InputDecoration(
                        labelText: 'Standard',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _formKey1.currentState!.validate();
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
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextFormField(
                      controller: _placecontroller,
                      decoration: const InputDecoration(
                        labelText: 'Place',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _formKey1.currentState!.validate();
                      },
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
                  const SizedBox(
                    height: 10,
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
                            ? Image.file(File(controller.image.value))
                            : const Text(
                                'Please Select An Image From Gallery',
                                textAlign: TextAlign.center,
                              ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey1.currentState!.validate() &&
                          controller.image.isNotEmpty) {
                        await editstudent();
                        Get.back();
                        controller.image.value = '';
                        Get.showSnackbar(const GetSnackBar(
                          backgroundColor: Colors.green,
                          title: "Success",
                          message: "Data Added Successfully",
                          duration: Duration(seconds: 2),
                          backgroundGradient: LinearGradient(colors: [
                            Color.fromARGB(255, 11, 220, 21),
                            Color.fromARGB(255, 33, 209, 42),
                          ]),
                          icon: Icon(
                            Icons.done_all,
                            color: Colors.white,
                          ),
                          borderRadius: 8,
                          margin: EdgeInsets.all(8.0),
                          dismissDirection: DismissDirection.horizontal,
                        ));

                        // Get.back();
                      } else if (controller.image.isEmpty) {
                        Get.showSnackbar(const GetSnackBar(
                          backgroundColor: Colors.red,
                          title: "Image Not Found",
                          message: "Please try to add Image",
                          duration: Duration(seconds: 2),
                          backgroundGradient: LinearGradient(colors: [
                            Color.fromARGB(255, 198, 18, 18),
                            Color.fromARGB(255, 237, 37, 23),
                          ]),
                          icon: Icon(
                            Icons.priority_high,
                            color: Colors.white,
                          ),
                          borderRadius: 8,
                          margin: EdgeInsets.all(8.0),
                          dismissDirection: DismissDirection.horizontal,
                        ));
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          backgroundColor: Colors.red,
                          title: "Failed to Add",
                          message: "Please Fill All the forms as Required",
                          duration: Duration(seconds: 2),
                          backgroundGradient: LinearGradient(colors: [
                            Color.fromARGB(255, 198, 18, 18),
                            Color.fromARGB(255, 237, 37, 23),
                          ]),
                          icon: Icon(
                            Icons.priority_high,
                            color: Colors.white,
                          ),
                          borderRadius: 8,
                          margin: EdgeInsets.all(8.0),
                          dismissDirection: DismissDirection.horizontal,
                        ));
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

  editstudent() {
    final StudentModel data = StudentModel(
        id: id,
        name: _namecontroller.text,
        age: _agecontroller.text,
        photo: controller.image.value,
        std: _stdcontroller.text,
        place: _placecontroller.text);

    controller.editStudents(data);
  }
}
