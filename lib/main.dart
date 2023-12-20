import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/model/model.dart';
import 'package:get_app/view/splash/spalsh.dart';
import 'package:get_app/view/theme/themes.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
     if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
    runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: GetMaterialApp(
        
      
        debugShowCheckedModeBanner: false,
        title: 'Student DataBase',
        theme: themeCustom,
        // home:   MyHomePage(title: 'Flutter Demo Home Page'),
        home: SplashScreen(),
      ),
    );
  }
}
