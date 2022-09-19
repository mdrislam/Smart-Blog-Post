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
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
    print(email);
    print(password);
  }
}
