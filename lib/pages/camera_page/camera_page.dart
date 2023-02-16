import 'package:flutter/material.dart';
import 'package:flutter_camera/util/face_detector_painter.dart';
import 'package:flutter_camera/widgets/camera_viewer.dart';
import 'package:flutter_camera/widgets/capture_button.dart';
import 'package:flutter_camera/widgets/top_image_viewer.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        CameraViewer(),
        CaptureButton(),
        TopImageViewer(),
      ],
    );
  }
}
