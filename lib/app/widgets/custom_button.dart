import 'package:flutter/material.dart';
import 'package:smart_blog_post/app/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback press;
  final String title;
  final Color textColor;
  final Color backgroundColor;
  const CustomButton(
      {Key? key,
      required this.press,
      required this.title,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.redAccent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: CustomText(
          text: title,
          color: textColor,
          size: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
