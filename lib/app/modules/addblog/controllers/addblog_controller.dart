import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_blog_post/app/data/core/const_strings.dart';

import 'package:smart_blog_post/app/modules/addblog/providers/addblog_provider.dart';
import 'package:smart_blog_post/app/modules/home/controllers/home_controller.dart';
import 'package:smart_blog_post/app/widgets/custom_progress_dialog.dart';
import 'package:smart_blog_post/app/widgets/custom_snake.dart';

class AddblogController extends GetxController {
  AddblogProvider provider;
  AddblogController({
    required this.provider,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> titleControler = TextEditingController().obs;
  Rx<TextEditingController> subTitleController = TextEditingController().obs;
  Rx<TextEditingController> slugController = TextEditingController().obs;
  Rx<TextEditingController> tagController = TextEditingController().obs;
  Rx<TextEditingController> categoryIDController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  ImagePicker imagePicker = ImagePicker();
  Rx<File> image = File('00').obs;
  var date = DateTime.now().obs;

  choiceImage() async {
    await imagePicker
        .pickImage(source: ImageSource.gallery)
        .then((selectedImage) {
      image.value = File(selectedImage!.path);
    });
  }

  checkValidattion() {
    if (image.value.path == '00') {
      showSnake(title: 'Alert !', message: 'Please Select Image ', type: false);
      return;
    }
    if (!formKey.currentState!.validate()) {
      return;
    }
    getCreateBlogPost(
        title: titleControler.value.text,
        subTitle: subTitleController.value.text,
        slug: slugController.value.text,
        tag: tagController.value.text,
        categoryId: categoryIDController.value.text,
        description: descriptionController.value.text,
        image: image.value,
        date: date.value.toString());
  }

  getCreateBlogPost(
      {required String title,
      required String subTitle,
      required String slug,
      required String tag,
      required String categoryId,
      required String description,
      required File image,
      required String date}) {
    showLoaderDialog(Get.context);
    try {
      provider
          .getCreateBlog(
              title: title,
              subTitle: subTitle,
              slug: slug,
              tag: tag,
              categoryId: categoryId,
              description: description,
              image: image,
              date: date)
          .then((response) {
        if (response.statusCode == 200) {
          Get.find<HomeController>().getBlogList();
          Get.back();
          Get.back();
          showSnake(
              title: 'On Success',
              message: 'Successfully Create Blog ',
              type: true);

          //Get.offAllNamed(Routes.HOME);
        } else {
          Get.back();
          showSnake(
              title: 'On Error ',
              message: ConstStrings.loginError,
              type: false);
        }
      }).onError((error, stackTrace) {
        Get.back();
        showSnake(title: 'On Error ', message: error.toString(), type: false);
      });
    } catch (err) {
      Get.back();

      showSnake(title: 'On Error ', message: err.toString(), type: false);
    }
  }

  @override
  void onClose() {}
}
