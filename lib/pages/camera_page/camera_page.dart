import 'package:flutter/material.dart';
import 'package:flutter_camera/util/app_colors.dart';
import 'package:flutter_camera/util/image_asset.dart';
import 'package:flutter_camera/widgets/app_button.dart';
import 'package:flutter_camera/widgets/camera_viewer.dart';
import 'package:flutter_camera/widgets/capture_button.dart';
import 'package:flutter_camera/widgets/got_faceLable.dart';
import 'package:flutter_camera/widgets/header.dart';
import 'package:flutter_camera/widgets/non_faceLabel.dart';
import 'package:flutter_camera/widgets/popup_Correct.dart';
import 'package:flutter_camera/widgets/popup_Incorrect.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_camera/pages/camera_page/controller/scan_controller.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

class CameraScreen extends GetView<ScanController> {
  CameraScreen({Key? key}) : super(key: key);

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(
      builder: (controller) {
        if (!controller.isInitialized) {
          return Container();
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.bgImg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Header(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 18,
                          ),
                          !controller.isGotFace.value
                              ? const NonFaceLabel()
                              : const GotFaceLabel(),
                          const SizedBox(
                            height: 16,
                          ),
                          const CameraViewer(),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            "Let's guess what kind of trash I am!",
                            style: TextStyle(
                              fontFamily: "ubuntu",
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  AppButton(
                                    onPressed: () async {
                                      await audioPlayer.play(
                                          AssetSource('audios/correct.mp3'));
                                      Get.dialog(PopupCorrect());
                                    },
                                    color: AppColors.subPrimary,
                                    image: Assets.recycleImg,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "RECYCLE",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.subPrimary,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  AppButton(
                                    onPressed: () async {
                                      await audioPlayer.play(
                                          AssetSource('audios/incorrect.mp3'));
                                      Get.dialog(const PopupInCorrect());
                                    },
                                    color: AppColors.orange,
                                    image: Assets.nonrecycleImg,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "NON-RECYCLE",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.orange,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (controller.imageTake.value.path != "")
                      Transform.rotate(
                        angle: pi,
                        child: Image.file(controller.imageTake.value),
                      ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(Assets.binImg),
                    ),
                    TextButton(
                      onPressed: controller.resetImage,
                      child: Text("reset image"),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
