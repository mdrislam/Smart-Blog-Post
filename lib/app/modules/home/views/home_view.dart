import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_blog_post/app/data/const/app_colors.dart';
import 'package:smart_blog_post/app/modules/editBlog/providers/edit_blog_provider.dart';

import 'package:smart_blog_post/app/widgets/custom_text.dart';

import '../../../routes/app_pages.dart';
import '../../editBlog/controllers/edit_blog_controller.dart';
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
          itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: ListTile(
                  leading: const Icon(
                    Icons.info,
                    size: 30,
                  ),
                  title: CustomText(
                    text: blogList[index].title.toString(),
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: CustomText(
                    text: blogList[index].description.toString(),
                    color: Colors.black,
                  ),
                  trailing: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.getDelete(
                              id: blogList[index].id!,
                            );
                          },
                          child: const Icon(
                            Icons.delete,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Get.lazyPut<EditBlogController>(
                                () => EditBlogController(
                                    provider: EditBlogProvider(),
                                    blog: blogList[index]),
                              );
                              Get.toNamed(Routes.EDIT_BLOG);
                            },
                            child: const Icon(Icons.edit,
                                color: Colors.greenAccent)),
                      ],
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: blogList!.length)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADDBLOG);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
