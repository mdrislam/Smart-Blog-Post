import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_blog_post/app/data/const/app_colors.dart';
import 'package:smart_blog_post/app/data/core/const_strings.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String lebleText;
  final String hintText;
  final TextInputType textInputType;
  final bool visible;
  final IconData icon;
  final VoidCallback? press;

  const CustomTextFormField({
    Key? key,
    required this.textEditingController,
    required this.lebleText,
    required this.hintText,
    required this.textInputType,
    this.visible = false,
    required this.icon,  this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: TextFormField(
          controller: textEditingController,
          keyboardType: textInputType,
          obscureText: visible,
          style: const TextStyle(fontSize: 18),
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
              ),
              suffixIcon: textInputType == TextInputType.visiblePassword
                  ? InkWell(
                      onTap: press,
                      child: Icon(
                        visible ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    )
                  : null,
              labelText: lebleText.toString(),
              hintText: hintText.toString(),
              labelStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryColor.withOpacity(0.3),
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                width: 1,
                color: AppColors.primaryColor.withOpacity(0.6),
              )),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.primaryColor.withOpacity(0.3),
                  )),
              errorStyle: const TextStyle(
                color: AppColors.primaryColor,
              )),
          validator: validation,
        ),
      ),
    );
  }

  String? validation(String? value) {
    if (textInputType == TextInputType.emailAddress) {
      if (value!.isEmpty) {
        return ConstStrings.emptyFields;
      } else if (!GetUtils.isEmail(value)) {
        return ConstStrings.invalidEmail;
      }
    }
    if (textInputType == TextInputType.visiblePassword) {
      if (value!.isEmpty) {
        return ConstStrings.emptyFields;
      } else if (value.length < 8) {
        return ConstStrings.passwordvalidation;
      }
    }
    if (textInputType == TextInputType.text) {
      if (value!.isEmpty) {
        return ConstStrings.emptyFields;
      }
    }

    return null;
  }
}
