import 'package:flutter_camera/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/util/image_asset.dart';

class PopupCorrect extends StatelessWidget {
  const PopupCorrect({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 50,
        right: 50,
        top: 200,
        bottom: 250,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.subPrimary,
          width: 5,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Text(
            "CORRECT!",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: AppColors.subPrimary,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          Image.asset(Assets.correctImg),
          Text(
            "GOOD JOB!",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: AppColors.grey,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
