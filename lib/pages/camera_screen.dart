import 'package:flutter/material.dart';
import 'package:flutter_camera/widgets/camera_viewer.dart';
import 'package:flutter_camera/widgets/capture_button.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        CameraViewer(),
        CaptureButton(),
      ],
    );
  }
}
