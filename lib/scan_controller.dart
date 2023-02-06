import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;

class ScanController extends GetxController {
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;
  final RxBool _isInitialized = RxBool(false);
  CameraImage? _cameraImage;
  final RxList<Uint8List> _imageList = RxList([]);
  Rx<File>? image;

  CameraController get cameraController => _cameraController;
  bool get isInitialized => _isInitialized.value;
  List<Uint8List> get imageList => _imageList;

  @override
  void dispose() {
    _isInitialized.value = false;
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.bgra8888);
    _cameraController.initialize().then((value) {
      _isInitialized.value = true;
      _cameraController.startImageStream((image) => _cameraImage = image);

      _isInitialized.refresh();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void onInit() {
    initCamera();
    super.onInit();
  }

  // img.Image _convertBGRA8888(CameraImage image) {
  //   return img.Image.fromBytes(
  //     image.width,
  //     image.height,
  //     image.planes[0].bytes,
  //     format: img.Format.bgra,
  //   );
  // }

  // void capture() {

  //   if (_cameraImage != null) {
  //     img = _convertBGRA8888(image);
  //     img.Image image = img.Image.fromBytes(_cameraImage!.width,
  //         _cameraImage!.height, _cameraImage!.planes[0].bytes,
  //         format: img.Format.bgra);
  //     Uint8List list = Uint8List.fromList(img.encodeJpg(image));
  //     _imageList.add(list);
  //     _imageList.refresh();
  //   }
  // }
  ///}

  // void capture() {
  //   try {
  //     img.Image _img;

  //     if (_cameraImage != null) {
  //       _img = _convertBGRA8888(_cameraImage!);
  //       img.PngEncoder pngEncoder = img.PngEncoder();
  //       // Convert to png
  //       List<int> png = pngEncoder.encodeImage(_img);
  //       //return png;
  //     }
  //   } catch (e) {
  //     print(">>>>>>>>>>>> ERROR:" + e.toString());
  //   }
  //   return null;
  // }

}
