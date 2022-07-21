import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';

class CustomTextField extends StatelessWidget {

  const CustomTextField({
    Key? key,
    this.placeholder,
    this.controller,
  }) : super(key: key) ;

  final String? placeholder;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      style: TextStyle(
        color: AppColors.black,
        fontSize: 16,
      ),
      controller: controller,
      placeholder: placeholder,
      placeholderStyle: TextStyle(
        color: AppColors.placeholderColor,
        fontSize: 16,
      ),
      padding: AppPadings.verticalHorizontal,
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
      ),
    );
  }
}