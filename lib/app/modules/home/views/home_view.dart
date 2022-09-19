import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: controller.obx((blogList) => ListView.separated(
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: const [
                    Image.network(src)
                  ],
                ),
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: blogList!.length)),
    );
  }
}
