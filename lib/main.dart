import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:programming_note_app/memo/memo.dart';
import 'package:programming_note_app/preference/storage_service/storeage_service.dart';
import 'package:programming_note_app/screen/home/home_screen.dart';
import 'package:get/get.dart';

import 'a.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
      //home: Home12(
      ),
    );
  }
}
