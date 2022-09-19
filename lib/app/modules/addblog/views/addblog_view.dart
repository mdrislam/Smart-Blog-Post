import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addblog_controller.dart';

class AddblogView extends GetView<AddblogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddblogView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddblogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
