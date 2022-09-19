import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/db/storage_healper.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  StorageHelper.init(await SharedPreferences.getInstance());
  runApp(
    GetMaterialApp(
      title: "SMART BLOG POST",
      initialRoute: StorageHelper.getString(key: 'token') != null
          ? Routes.HOME
          : AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
