import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_blog_post/app/modules/login/providers/login_provider.dart';

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
    try {
      provider.getUserLogin(email: email, password: password).then((response) {
        if (response.statusCode == 200) {
          print('success');
          print(json.decode(response.body));
        } else {
          print('Something went to wrong try again');
        }
      }).onError((error, stackTrace) {
        print('Something went to wrong: $error');
      });
    } catch (e) {
      print('error ocur:$e');
    }
  }
}
