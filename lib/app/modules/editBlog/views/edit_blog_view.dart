import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_blog_post/app/widgets/custom_button.dart';

import '../../../widgets/custom_text_form_field.dart';
import '../controllers/edit_blog_controller.dart';

class EditBlogView extends GetView<EditBlogController> {
  const EditBlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Blog View'),
        centerTitle: true,
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  CustomTextFormField(
                      textEditingController: controller.titleControler.value,
                      lebleText: 'Title',
                      hintText: 'enter title here',
                      textInputType: TextInputType.text,
                      icon: Icons.title),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomTextFormField(
                      textEditingController:
                          controller.subTitleController.value,
                      lebleText: 'Sub-Title',
                      hintText: 'enter sub-title here ',
                      textInputType: TextInputType.text,
                      icon: Icons.subtitles),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomTextFormField(
                      textEditingController: controller.slugController.value,
                      lebleText: 'Slug',
                      hintText: 'enter slug here',
                      textInputType: TextInputType.text,
                      icon: Icons.link),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomTextFormField(
                      textEditingController:
                          controller.descriptionController.value,
                      lebleText: 'Description',
                      hintText: 'enter description here',
                      textInputType: TextInputType.text,
                      icon: Icons.description),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomTextFormField(
                      textEditingController:
                          controller.categoryIDController.value,
                      lebleText: 'Categry Id',
                      hintText: 'enter category id here',
                      textInputType: TextInputType.text,
                      icon: Icons.category),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  CustomButton(
                      press: () {
                        controller.checkValidattion();
                      },
                      title: 'Update'),
                ],
              ),
            ),
          )),
    );
  }
}
