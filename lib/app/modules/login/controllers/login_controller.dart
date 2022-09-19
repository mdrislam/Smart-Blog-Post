import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_blog_post/app/data/core/const_strings.dart';
import 'package:smart_blog_post/app/data/db/storage_healper.dart';
import 'package:smart_blog_post/app/modules/login/providers/login_provider.dart';
import 'package:smart_blog_post/app/routes/app_pages.dart';
import 'package:smart_blog_post/app/widgets/custom_progress_dialog.dart';
import 'package:smart_blog_post/app/widgets/custom_snake.dart';

class LoginController extends GetxController {
  LoginProvider provider;
  LoginController({
    required this.provider,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  RxBool visible = true.obs;
  @override
  void onInit() {
    emailController = TextEditingController(text: 'admin@gmail.com');
    passwordController = TextEditingController(text: '12345678');
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  ///check Form Validation
  getFormValidation() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    getUserLogin(
        email: emailController.text, password: passwordController.text);
  }
  ///Getting user login by email and password
  getUserLogin({required String email, required String password}) {
    showLoaderDialog(Get.context);
    try {
      provider.getUserLogin(email: email, password: password).then((response) {
        if (response.statusCode == 200) {
          Get.back();
          showSnake(
              title: ConstStrings.loginSuccess,
              message: ConstStrings.loginSuccessMessage,
              type: true);

          ///Store Login Token
          StorageHelper.setString(
              key: 'token', value: json.decode(response.body)['data']['token']);

          ///Navigate to Next Screen
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.back();
          showSnake(
              title: ConstStrings.loginErrorTitle,
              message: ConstStrings.invalidEmail,
              type: false);
        }
      }).onError((error, stackTrace) {
        Get.back();
        showSnake(
            title: ConstStrings.loginErrorTitle,
            message: ConstStrings.loginError,
            type: false);
      });
    } catch (e) {
      Get.back();
      showSnake(
          title: ConstStrings.loginErrorTitle,
          message: ConstStrings.loginError,
          type: false);
    }
  }
}
