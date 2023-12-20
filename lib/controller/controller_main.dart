import 'package:get/get.dart';
import 'package:get_app/model/model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../view/home/homescreen.dart';

const String dBNAME = 'student_database';

class MyGXController extends GetxController {
  RxList<StudentModel> studentListNot = <StudentModel>[].obs;

  navigation() async {
    Future.delayed(const Duration(seconds: 5), () async {
      await Get.off(() => MyHomePage());
    });
  }

  Future<void> addStudents(StudentModel value) async {
    final db = await Hive.openBox(dBNAME);
    value.id = await db.add(value);
   await db.put(value.id, value);
    studentsRefresh();
    // db.close();
  }

  Future<void> editStudents(StudentModel value) async {
    final db = await Hive.openBox(dBNAME);

    db.put(value.id, value);

    studentsRefresh();
  }

  Future<List<dynamic>> getAllData() async {
    final db = await Hive.openBox(dBNAME);

    return db.values.toList();
  }

  Future<void> studentsRefresh() async {
    studentListNot.clear();
    final allStudents = await getAllData();
    for (var element in allStudents) {
      studentListNot.add(element);
    }
  }

  Future<void> deleteData(int? id) async {
    final db = await Hive.openBox(dBNAME);
    await db.delete(id);
    studentsRefresh();
   
  }

  Future<void> searchStudents(String value) async {
    final alldata = await getAllData();
    studentListNot.clear();
    for (var element in alldata) {
      if (element.name.toLowerCase().contains(value.toLowerCase())) {
        studentListNot.add(element);
      }
    }
  }

  RxString image = ''.obs;

  Future<void> pickImage() async {
    final imgFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    image.value = imgFile!.path;
    update();
  }
}
