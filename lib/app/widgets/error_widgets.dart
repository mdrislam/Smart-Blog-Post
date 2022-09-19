import 'package:flutter/material.dart';
import 'package:smart_blog_post/app/data/const/app_colors.dart';
import 'package:smart_blog_post/app/widgets/custom_button.dart';
import 'package:smart_blog_post/app/widgets/custom_text.dart';

class ErrorWidgets extends StatelessWidget {
  final String text, title;
  final VoidCallback press;
  const ErrorWidgets(
      {Key? key, required this.text, required this.title, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          text: text,
          color: AppColors.primaryColor,
          size: 25,
          fontWeight: FontWeight.bold,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: CustomButton(press: press, title: title),
        )
      ],
    );
  }
}
