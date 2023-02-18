import 'package:flutter/material.dart';
import 'package:flutter_camera/util/app_colors.dart';
import 'package:flutter_camera/util/image_asset.dart';
import 'package:flutter_camera/widgets/app_button.dart';
import 'package:flutter_camera/widgets/camera_viewer.dart';
import 'package:flutter_camera/widgets/capture_button.dart';
import 'package:flutter_camera/widgets/header.dart';
import 'package:flutter_camera/widgets/popup_Correct.dart';
import 'package:flutter_camera/widgets/popup_Incorrect.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.bgImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
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
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.unionImg),
                  const SizedBox(
                    width: 24,
                  ),
                  Text(
                    "LET'S CHOOSE",
                    style: TextStyle(
                      fontFamily: "GloriaHallelujah",
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                      color: AppColors.brown,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Image.asset(Assets.unionImg),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Column(
                  children: [
                    const CameraViewer(),
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppButton(
                          text: "ORGANIC",
                          onPressed: () {
                            Get.dialog(const PopupCorrect());
                          },
                          color: AppColors.subPrimary,
                        ),
                        AppButton(
                          text: "INOGANIC",
                          onPressed: () {
                            Get.dialog(const PopupInCorrect());
                          },
                          color: AppColors.primary,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: const SizedBox(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(Assets.binImg),
              ),
              // CaptureButton(),
              //TopImageViewer(),
            ],
          ),
        ),
      ),
    );
  }
}
