import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';

class CustomTextField extends StatelessWidget {

  final String? placeholder;

  const CustomTextField({
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      style: TextStyle(
        color: AppColors.black,
        fontSize: 16,
      ),
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