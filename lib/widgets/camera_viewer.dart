import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/pages/camera_page/controller/scan_controller.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraViewer extends GetView<ScanController> {
  const CameraViewer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(builder: (controller) {
      if (!controller.isInitialized) {
        return Container();
      }
      return SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CameraPreview(controller.cameraController),
            controller.customPaint.value,
          ],
        ),
      );
    });
  }
}
