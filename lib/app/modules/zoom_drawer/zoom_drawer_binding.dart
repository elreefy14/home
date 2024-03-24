import 'package:get/get.dart';

import './zoom_drawer_controller.dart';

class ZoomDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ZoomDrawerController>(
      () => ZoomDrawerController(),
    );
  }
}
