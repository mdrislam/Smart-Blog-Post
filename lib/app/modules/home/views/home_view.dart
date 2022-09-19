import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_blog_post/app/data/const/app_colors.dart';
import 'package:smart_blog_post/app/widgets/custom_text.dart';

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
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: blogList[index].title.toString(),
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      text: blogList[index].description.toString(),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: blogList!.length)),
    );
  }
}
