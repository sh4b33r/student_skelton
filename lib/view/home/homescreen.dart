import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controller/controller_main.dart';
import 'package:get_app/view/add/add_screen.dart';
import 'package:get_app/view/home/widgets/custom_grid.dart';
import 'package:get_app/view/theme/themes.dart';
import 'widgets/search.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final controller = Get.find<MyGXController>();
  @override
  Widget build(BuildContext context) {
    controller.studentsRefresh();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Clr.appbar,
          centerTitle: true,
          title: const Text("Students App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 47, 37, 1),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              controller.image.value = '';
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
                children: [Expanded(child: CustomGridview())],
              ),
            ),
          ],
        ));
  }
}
