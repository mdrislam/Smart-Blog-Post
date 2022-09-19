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
          controller: controller.scrollController,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primaryColor.withOpacity(0.09),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.image,
                      size: 50,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: blogList[index].title.toString(),
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: blogList[index].description.toString(),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: blogList!.length)),
    );
  }
}
