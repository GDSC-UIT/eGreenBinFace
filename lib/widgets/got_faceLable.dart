import 'package:flutter/cupertino.dart';
import 'package:flutter_camera/util/app_colors.dart';
import 'package:flutter_camera/util/image_asset.dart';

class GotFaceLabel extends StatelessWidget {
  const GotFaceLabel({super.key});

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
          Image.asset(Assets.greenFaceImg),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Text(
              "Yeah! I realized who you are!",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.subPrimary,
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
