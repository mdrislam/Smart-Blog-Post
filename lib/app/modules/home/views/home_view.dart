import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_blog_post/app/data/const/app_colors.dart';

import 'package:smart_blog_post/app/widgets/custom_text.dart';

import '../../../routes/app_pages.dart';
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
                    text: blogList[index].title.toString(),
                    color: Colors.black,
                  ),
                  trailing: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.getDelete(id: blogList[index].id!,);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const Icon(Icons.edit, color: Colors.greenAccent),
                      ],
                    ),
                  ),
                ),

                // child: Container(
                //   padding: const EdgeInsets.all(8),
                //   margin: const EdgeInsets.symmetric(horizontal: 5),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5),
                //     color: AppColors.primaryColor.withOpacity(0.09),
                //   ),
                //   child: Row(
                //     children: [
                //       const Icon(
                //         Icons.image,
                //         size: 50,
                //       ),
                //       const SizedBox(
                //         width: 20,
                //       ),
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Align(
                //               alignment: Alignment.topRight,
                //               child: Row(
                //                 children: const [],
                //               ),
                //             ),
                //             CustomText(
                //               text: blogList[index].title.toString(),
                //               color: AppColors.primaryColor,
                //               fontWeight: FontWeight.w700,
                //             ),
                //             const SizedBox(
                //               height: 10,
                //             ),
                //             CustomText(
                //               text: blogList[index].description.toString(),
                //               color: Colors.black,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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
