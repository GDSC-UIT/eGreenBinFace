import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/pages/camera_page/controller/scan_controller.dart';
import 'package:flutter_camera/util/app_colors.dart';
import 'package:get/get.dart';

class CameraViewer extends GetView<ScanController> {
  const CameraViewer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(
      builder: (controller) {
        if (!controller.isInitialized) {
          return Container();
        }
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.brown, width: 5),
          ),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1 / 0.9,
                child: ClipRect(
                  child: Transform.scale(
                    scale: controller.cameraController.value.aspectRatio / 0.7,
                    child: Center(
                      child: CameraPreview(controller.cameraController),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
