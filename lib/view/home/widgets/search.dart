import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controller/controller_main.dart';
// import 'package:get/get.dart';



class CustomSearchBar extends StatelessWidget {
 
  CustomSearchBar({super.key});

 final TextEditingController searchController = TextEditingController();

  final controller = Get.find<MyGXController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: searchController,
        onChanged: (value) async {
          await controller.searchStudents(value);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
              onPressed: () {
                controller.studentsRefresh();
                searchController.clear();
              },
              icon: const Icon(Icons.close)),
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          hintText:"Search"
        ),
      ),
    );
  }
}
