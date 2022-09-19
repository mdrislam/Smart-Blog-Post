import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnake(
    {required String title, required String message, required bool type}) {
  Get.snackbar(title, message,
      backgroundColor: type ? Colors.greenAccent : Colors.redAccent,
      colorText: Colors.white,
      icon: Icon(type ? Icons.check : Icons.error),snackPosition: SnackPosition.BOTTOM);
}
