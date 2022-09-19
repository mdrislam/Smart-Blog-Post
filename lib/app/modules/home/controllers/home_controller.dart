// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';

import 'package:smart_blog_post/app/modules/home/providers/home_provider.dart';

import '../../../data/model/blog_list_response.dart';

class HomeController extends GetxController with StateMixin<List<Blog>> {
  HomeProvider provider;
  HomeController({
    required this.provider,
  });
  var blogList = <Blog>[].obs;
  @override
  void onInit() {
    getBlogList();
    super.onInit();
  }

  getBlogList() {
    change(null, status: RxStatus.loading());
    try {
      provider.getBlogList().then((response) {
        if (response.statusCode == 200) {
          var body = json.decode(response.body);
          blogList.value = BlogListResponse.fromJson(body).data!.blogs!.data!;
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

  @override
  void onClose() {}

}
