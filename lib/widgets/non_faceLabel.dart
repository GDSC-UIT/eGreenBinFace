import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_camera/util/app_colors.dart';
import 'package:flutter_camera/util/image_asset.dart';

class NonFaceLabel extends StatelessWidget {
  const NonFaceLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      color: AppColors.lightGrey,
      child: Row(
        children: [
          Image.asset(Assets.redFaceImg),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Text(
              "Please position your pretty face in the camera frame!",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.red,
                fontSize: 14,
                fontFamily: "ubuntu",
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
