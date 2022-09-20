import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: const Center(
        child: Text(
          'EditBlogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
