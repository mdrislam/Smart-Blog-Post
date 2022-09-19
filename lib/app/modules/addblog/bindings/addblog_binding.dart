import 'package:get/get.dart';

import '../controllers/addblog_controller.dart';

class AddblogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddblogController>(
      () => AddblogController(),
    );
  }
}
