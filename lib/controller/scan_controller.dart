import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'dart:math';

class ScanController extends GetxController {
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;
  final RxBool _isInitialized = RxBool(false);
  CameraImage? _cameraImage;
  final RxList<Uint8List> _imageList = RxList([]);
  //final RxList<File> _imageList1 = RxList([]);
  Rx<File> imageTake = File("").obs;

  CameraController get cameraController => _cameraController;
  bool get isInitialized => _isInitialized.value;
  // List<File> get imageList1 => _imageList1;
  List<Uint8List> get imageList => _imageList;

  @override
  void dispose() {
    _isInitialized.value = false;
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[1], ResolutionPreset.high);
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

  img.Image _convertYUV420(CameraImage image) {
    var _img = img.Image(image.width, image.height); // Create Image buffer

    Plane plane = image.planes[0];
    const int shift = (0xFF << 24);

    // Fill image buffer with plane[0] from YUV420_888
    for (int x = 0; x < image.width; x++) {
      for (int planeOffset = 0;
          planeOffset < image.height * image.width;
          planeOffset += image.width) {
        final pixelColor = plane.bytes[planeOffset + x];
        // color: 0x FF  FF  FF  FF
        //           A   B   G   R
        // Calculate pixel color
        var newVal =
            shift | (pixelColor << 16) | (pixelColor << 8) | pixelColor;

        _img.data[planeOffset + x] = newVal;
      }
    }

    return _img;
  }

//old capture method
  void capture() async {
    if (_cameraImage != null) {
      // img.Image image = img.Image.fromBytes(_cameraImage!.width,
      //     _cameraImage!.height, _cameraImage!.planes[0].bytes,
      //     format: img.Format.bgra);
      img.Image image = _convertYUV420(_cameraImage!);
      Uint8List list = Uint8List.fromList(img.encodeJpg(image));
      _imageList.add(list);
      //_imageList1.add(File.fromRawPath(list));
      _imageList.refresh();
      // _imageList1.refresh();

      //fd
      var rng = Random();
      Directory tempDir = await getTemporaryDirectory();
      File file =
          await File('${tempDir.path}/image${rng.nextInt(5)}.png').create();
      file.writeAsBytesSync(list);
      imageTake.value = file;
    }
    // print("capture image");
    // XFile captureImg = await _cameraController.takePicture();
    // _imageList.add(File(captureImg.path));
    // _imageList.refresh();
    // print("capture image finish");
  }

  // img.Image _convertBGRA8888(CameraImage image) {
  //   return img.Image.fromBytes(
  //     image.width,
  //     image.height,
  //     image.planes[0].bytes,
  //     format: img.Format.bgra,
  //   );
  // }

  // //new capture
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
