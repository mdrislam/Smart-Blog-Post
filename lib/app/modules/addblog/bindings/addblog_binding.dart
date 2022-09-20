import 'package:get/get.dart';
import 'package:smart_blog_post/app/modules/addblog/providers/addblog_provider.dart';

import '../controllers/addblog_controller.dart';

class AddblogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddblogController>(
      () => AddblogController(provider: AddblogProvider()),
    );
  }
}
