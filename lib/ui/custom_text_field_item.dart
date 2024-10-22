import 'package:e_commerce_app/ui/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldItem extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObscure;
  var keyboardType;
  void Function()? suffixIconFunction;
  String? Function(String?)? validator;
  TextEditingController controller;
  CustomTextFieldItem(
      {super.key,
      required this.fieldName,
      required this.hintText,
      this.suffixIcon,
      this.isObscure = false,
      required this.validator,
      required this.controller,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 18.sp, color: AppColors.primaryColor),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: AppColors.whiteColor,
                filled: true,
                suffixIcon: InkWell(
                  onTap: suffixIconFunction,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blackColor),
                    borderRadius: BorderRadius.circular(15.r)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blackColor),
                    borderRadius: BorderRadius.circular(15.r)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blackColor),
                    borderRadius: BorderRadius.circular(15.r)),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.blackColor)),
            style: TextStyle(color: AppColors.blackColor),
            validator: validator,
            controller: controller,
            obscureText: isObscure,
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
