import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_blog_post/app/data/const/app_colors.dart';
import 'package:smart_blog_post/app/widgets/custom_text.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../controllers/addblog_controller.dart';

class AddblogView extends GetView<AddblogController> {
  const AddblogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: AppColors.primaryColor),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CustomText(
          text: 'Add New Blog',
          color: Colors.black,
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Obx(() => SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        if (controller.image.value.path != '00')
                          Image.file(
                            controller.image.value,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        if (controller.image.value.path == '00')
                          Container(
                            color: AppColors.primaryColor.withOpacity(0.5),
                            child: const Center(
                                child: CustomText(
                              text: 'Select Blog Image ',
                              color: Colors.black,
                            )),
                          ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                              onTap: () {
                                controller.choiceImage();
                              },
                              child:
                                  const CircleAvatar(child: Icon(Icons.add))),
                        )
                      ],
                    ),
                  )),
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
                  textEditingController: controller.subTitleController.value,
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
                  textEditingController: controller.descriptionController.value,
                  lebleText: 'Description',
                  hintText: 'enter description here',
                  textInputType: TextInputType.text,
                  icon: Icons.description),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomTextFormField(
                  textEditingController: controller.categoryIDController.value,
                  lebleText: 'Categry Id',
                  hintText: 'enter category id here',
                  textInputType: TextInputType.text,
                  icon: Icons.category),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomTextFormField(
                  textEditingController: controller.tagController.value,
                  lebleText: 'Tags',
                  hintText: 'enter tags here',
                  textInputType: TextInputType.text,
                  icon: Icons.tag),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              CustomButton(
                  press: () {
                    controller.checkValidattion();
                  },
                  title: 'Store'),
            ],
          ),
        ),
      ),
    );
  }
}
