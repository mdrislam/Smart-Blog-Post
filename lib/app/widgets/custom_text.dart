import 'package:flutter/material.dart';
import 'package:smart_blog_post/app/data/const/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double size;
  final Color color;
  const CustomText(
      {Key? key,
      required this.text,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.size = 18,
      this.color = AppColors.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }
}
