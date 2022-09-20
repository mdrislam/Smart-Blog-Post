import 'package:get/get.dart';

import '../controllers/edit_blog_controller.dart';

class EditBlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditBlogController>(
      () => EditBlogController(),
    );
  }
}
