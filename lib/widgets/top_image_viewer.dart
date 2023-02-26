import 'package:flutter/material.dart';
import 'package:egreenbin_face/pages/camera_page/controller/scan_controller.dart';

import 'package:get/get.dart';

class TopImageViewer extends StatelessWidget {
  const TopImageViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(
      builder: (controller) => Positioned(
        top: 50,
        left: 0,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: Get.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.imageList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 500,
                      width: 200,
                      child: Container(
                          margin: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red,
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset:
                                    Offset(3, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Image.memory(controller.imageList[index])),
                    );
                  }),
            ),
            controller.imageTake.value.path != ""
                ? SizedBox(
                    height: 100,
                    width: Get.width,
                    child: Image.file(controller.imageTake.value),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
