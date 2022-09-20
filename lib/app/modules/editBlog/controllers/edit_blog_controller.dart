// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smart_blog_post/app/data/core/const_strings.dart';
import 'package:smart_blog_post/app/data/model/blog_list_response.dart';
import 'package:smart_blog_post/app/modules/editBlog/providers/edit_blog_provider.dart';
import 'package:smart_blog_post/app/modules/home/controllers/home_controller.dart';
import 'package:smart_blog_post/app/widgets/custom_progress_dialog.dart';
import 'package:smart_blog_post/app/widgets/custom_snake.dart';

class EditBlogController extends GetxController {
  EditBlogProvider provider;
  Blog blog;
  EditBlogController({
    required this.provider,
    required this.blog,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<TextEditingController> titleControler = TextEditingController().obs;
  Rx<TextEditingController> subTitleController = TextEditingController().obs;
  Rx<TextEditingController> slugController = TextEditingController().obs;

  Rx<TextEditingController> categoryIDController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;

  var date = ''.obs;

  checkValidattion() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    getUpdateBlogPost(
        title: titleControler.value.text,
        subTitle: subTitleController.value.text,
        slug: slugController.value.text,
        categoryId: categoryIDController.value.text,
        description: descriptionController.value.text,
        image: File(''),
        date: date.value.toString(),
        id: blog.id!);
  }

  getUpdateBlogPost(
      {required String title,
      required String subTitle,
      required String slug,
      required String categoryId,
      required String description,
      required File image,
      required int id,
      required String date}) {
    showLoaderDialog(Get.context);
    try {
      provider
          .getupdateBlog(
              title: title,
              subTitle: subTitle,
              slug: slug,
              categoryId: categoryId,
              description: description,
              image: image,
              id: id,
              date: date)
          .then((response) {
        if (response.statusCode == 200) {
          Get.find<HomeController>().getBlogList();
          Get.back();
          Get.back();
          showSnake(
              title: 'On Success',
              message: 'Successfully Updated Blog ',
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
  void onInit() {
    onInitBlog(blog);
    super.onInit();
  }

  onInitBlog(Blog blog) {
    titleControler.value.text = blog.title!;
    subTitleController.value.text = blog.subTitle!;
    slugController.value.text = blog.slug!;

    categoryIDController.value.text = blog.categoryId!;
    descriptionController.value.text = blog.description!;

    date.value = blog.date!;
  }

  @override
  void onClose() {}
}
