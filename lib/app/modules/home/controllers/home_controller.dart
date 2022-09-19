// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:smart_blog_post/app/modules/home/providers/home_provider.dart';

import '../../../data/model/blog_list_response.dart';

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

  @override
  void onClose() {
    scrollController.dispose();
  }
}
