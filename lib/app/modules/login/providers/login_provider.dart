import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smart_blog_post/app/data/const/base_url.dart';

class LoginProvider extends GetConnect {
  Future<dynamic> getUserLogin({String? email, String? password}) =>
      http.post(Uri.parse('${BaseUrl.baseUrl}/login'),
          body: <String, dynamic>{'email': email, 'password': password});
}
