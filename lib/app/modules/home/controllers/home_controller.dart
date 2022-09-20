// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:smart_blog_post/app/modules/home/providers/home_provider.dart';
import 'package:smart_blog_post/app/widgets/custom_progress_dialog.dart';

import '../../../data/core/const_strings.dart';
import '../../../data/model/blog_list_response.dart';
import '../../../widgets/custom_snake.dart';

class HomeController extends GetxController with StateMixin<List<Blog>> {
  HomeProvider provider;
  HomeController({
    required this.provider,
  });
  var blogList = <Blog>[].obs;
  ScrollController scrollController = ScrollController();
  int currentPage = 1;
  int lastPage = 0;
  RxBool isLoading = false.obs;
  RxBool isMore = false.obs;

  @override
  void onInit() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        ++currentPage;
        if (currentPage <= lastPage) {
          // getAddMore();
        } else {
          isMore.value = true;
        }
      }
    });
    getBlogList();

    super.onInit();
  }

  ///Get Blog List by User Token
  getBlogList() {
    change(null, status: RxStatus.loading());
    try {
      provider.getBlogList(page: currentPage).then((response) {
        if (response.statusCode == 200) {
          var body = json.decode(response.body);

          var dataResponse = BlogListResponse.fromJson(body);
          blogList.value = dataResponse.data!.blogs!.data!;
          lastPage = dataResponse.data!.blogs!.lastPage!;

          change(blogList, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error('Empty Blog '));
        }
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error('Something went to wrong !'));
      });
    } catch (error) {
      change(null, status: RxStatus.error('Something went to wrong !'));
    }
  }

  ///Get Paging Call
  getAddMore() {
    isMore.value = false;
    isLoading.value = true;
    print('Data');
    try {
      provider.getBlogList(page: currentPage).then((response) {
        if (response.statusCode == 200) {
          var body = json.decode(response.body);

          blogList.addAll(BlogListResponse.fromJson(body).data!.blogs!.data!);
          print('Data');
          isLoading.value = false;
        } else {
          isLoading.value = false;
        }
      }).onError((error, stackTrace) {
        isLoading.value = false;
      });
    } catch (error) {
      isLoading.value = false;
    }
  }

  ///Get Blog List by User Token
  getDelete({required int id}) {
    showLoaderDialog(Get.context);
    try {
      provider.getDelete(id: 39,).then((response) {
        print(response.statusCode);
        if (response.statusCode == 200) {
          
          getBlogList();
          Get.back();
          showSnake(
              title: 'On Success',
              message: 'Successfully Deleted Blog ',
              type: true);
        } else {
          Get.back();
          showSnake(
              title: 'On Error ',
              message: ConstStrings.loginError,
              type: false);
        }
      }).onError((error, stackTrace) {
        Get.back();
        showSnake(title: 'On Error ', message: error.toString(), type: false);
      });
    } catch (err) {
      print(err);
      Get.back();

      showSnake(title: 'On Error ', message: err.toString(), type: false);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
  }
}
