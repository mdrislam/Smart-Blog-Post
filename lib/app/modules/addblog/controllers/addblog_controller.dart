import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddblogController extends GetxController {
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

  @override
  void onClose() {}
  choiceImage() async {
    await imagePicker
        .pickImage(source: ImageSource.gallery)
        .then((selectedImage) {
      image.value = File(selectedImage!.path);
    });
  }
}
