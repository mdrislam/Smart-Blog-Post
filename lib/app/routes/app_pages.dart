import 'package:get/get.dart';

import '../modules/addblog/bindings/addblog_binding.dart';
import '../modules/addblog/views/addblog_view.dart';
import '../modules/editBlog/bindings/edit_blog_binding.dart';
import '../modules/editBlog/views/edit_blog_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADDBLOG,
      page: () => const AddblogView(),
      binding: AddblogBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_BLOG,
      page: () => EditBlogView(),
      binding: EditBlogBinding(),
    ),
  ];
}
