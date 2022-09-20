import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_blog_post/app/data/const/base_url.dart';

import '../../../data/db/storage_healper.dart';

class AddblogProvider extends GetConnect {
  Future<dynamic> getCreateBlog(
      {required String title,
      required String subTitle,
      required String slug,
      required String tag,
      required String categoryId,
      required String description,
      required File image,
      required String date}) async {
    String addimageUrl = '${BaseUrl.baseUrl}/admin/blog-news/store';
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl));
    request.headers.addAll(headers);
    request.fields.addAll({
      'title': title,
      'sub_title': subTitle,
      'slug': slug,
      'description': description,
      'category_id': categoryId,
      'date': date,
      'tags': tag,
    });
    request.files
        .addAll({await http.MultipartFile.fromPath('image', image.path)});

    return request.send();
  }
}
