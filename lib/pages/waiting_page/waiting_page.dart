import 'package:flutter/material.dart';
import 'package:egreenbin_face/util/app_colors.dart';
import 'package:egreenbin_face/util/image_asset.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(Assets.binImg),
            Text(
              "TOGETHER",
              style: TextStyle(
                color: AppColors.subPrimary,
                fontSize: 25,
                fontFamily: "GloriaHallelujah",
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "SAVE OUR PLANET",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Image.asset(Assets.earthImg),
            ),
            Text(
              "eGreenBin",
              style: TextStyle(
                color: AppColors.subPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Image.asset(Assets.footerImg),
          ],
        ),
      ),
    );
  }
}
