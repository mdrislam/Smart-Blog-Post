import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_blog_post/app/data/const/base_url.dart';
import 'package:smart_blog_post/app/data/db/storage_healper.dart';

class EditBlogProvider extends GetConnect {
  Future<dynamic> getupdateBlog(
          {required String title,
          required String subTitle,
          required String slug,
          required String categoryId,
          required String description,
          required File image,
          required String date,
          required int id}) =>
      http.post(Uri.parse('${BaseUrl.baseUrl}/admin/blog-news/update/$id'),
          headers: <String, String>{
            'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
          },
          body: <String, dynamic>{
            'title': title,
            'sub_title': subTitle,
            'slug': slug,
            'description': description,
            'category_id': categoryId,
            'date': date,
          });
}
