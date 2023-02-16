import 'package:flutter/material.dart';
import 'package:flutter_camera/pages/camera_screen.dart';
import 'package:flutter_camera/widgets/camera_viewer.dart';
import 'package:flutter_camera/controller/global_bindings.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GlobalBindings(),
      debugShowCheckedModeBanner: false,
      title: "Camera Application",
      home: const CameraScreen(),
    );
  }
}
