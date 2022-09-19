import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnake(
    {required String title, required String message, required bool type}) {
  Get.snackbar(title, message,
      backgroundColor: type
          ? const Color.fromARGB(255, 4, 128, 68)
          : const Color.fromARGB(255, 159, 10, 10),
      colorText: Colors.white,
      icon: Icon(
        type ? Icons.check : Icons.error,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM);
}
