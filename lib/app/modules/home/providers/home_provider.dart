import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_blog_post/app/data/const/base_url.dart';
import 'package:smart_blog_post/app/data/db/storage_healper.dart';

class HomeProvider extends GetConnect {
  Future<dynamic> getBlogList() => http.get(
        Uri.parse(BaseUrl.baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
        },
      );
}
