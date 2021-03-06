import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';

class CustomTextFieldPassword extends StatefulWidget {

  const CustomTextFieldPassword({
    Key? key,
    this.placeholder,
    this.controller,
  }) : super(key: key);

  final String? placeholder;
  final TextEditingController? controller;

  @override
  _CustomTextFieldPasswordState createState() => _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      obscureText: isVisible,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 16,
      ),
      controller: widget.controller,
      placeholder: widget.placeholder,
      placeholderStyle: TextStyle(
        color: AppColors.placeholderColor,
        fontSize: 16,
      ),
      padding: AppPadings.verticalHorizontal,
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
      ),
      suffix: GestureDetector(
        child: Container(
          padding: AppPadings.onlyRight,
          child: Icon(
            isVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye, 
            color: AppColors.black,
          ),
        ),
        onTap: (){
          setState(() {
            isVisible = !isVisible;
          });
        },
      ),
    );
  }
}


