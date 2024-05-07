import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/my_dart_controller.dart';

class MyDartDataScreen extends StatelessWidget {
  MyDartDataScreen({super.key});

  final MyDartController _myDartController = Get.put(MyDartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(_myDartController.myPayloadModel.body?.payload?.title ??
                  "Title"),
              Text(
                  _myDartController.myPayloadModel.body?.payload?.description ??
                      "Description"),
            ],
          );
        }),
      ),
    );
  }
}
