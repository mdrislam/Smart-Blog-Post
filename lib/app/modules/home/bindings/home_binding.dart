import 'package:get/get.dart';
import 'package:smart_blog_post/app/modules/home/providers/home_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(provider: HomeProvider()), permanent: true);
    // Get.lazyPut<HomeController>(
    //   () => HomeController(provider: HomeProvider()),
    // );
  }
}
