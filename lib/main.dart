import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uts_todo/app/helper/color.dart';

import 'app/helper/fontstyle.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: CoimColor.appcolor,
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(),
        fontFamily: 'HindSiliguriRegular',
        scaffoldBackgroundColor: CoimColor.white,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: CoimColor.black),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: hsMedium.copyWith(
            color: CoimColor.black,
            fontSize: 16,
          ),
          color: CoimColor.transparent,
        ),
      ),
    );
  }
}
