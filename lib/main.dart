import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exercise_app/video_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        )
    );
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return   GetMaterialApp(
          title: 'Exercise App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/',
          getPages:[
            GetPage(
              name:'/',
              page:()=>HomePage(),
            ),
            GetPage(
              name:'/video',
              page:()=>VideoInfo(),
            ),
          ],
        );
      },
    );
  }
}


