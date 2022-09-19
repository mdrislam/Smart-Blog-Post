import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_blog_post/app/data/const/app_colors.dart';
import 'package:smart_blog_post/app/data/core/const_strings.dart';
import 'package:smart_blog_post/app/widgets/custom_text.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const CustomText(
                text: 'USER LOG-IN',
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                size: 25,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              CustomTextFormField(
                  textEditingController: controller.emailController,
                  lebleText: ConstStrings.emailTitle,
                  hintText: ConstStrings.emailEntryHints,
                  textInputType: TextInputType.emailAddress,
                  icon: Icons.email),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomTextFormField(
                  textEditingController: controller.passwordController,
                  lebleText: ConstStrings.passwordTitle,
                  hintText: ConstStrings.passwordEntryHints,
                  textInputType: TextInputType.visiblePassword,
                  icon: Icons.password),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              CustomButton(
                  press: () {
                    controller.getFormValidation();
                  },
                  title: ConstStrings.login),
            ],
          ),
        ),
      ),
    );
  }
}
