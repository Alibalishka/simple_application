import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/widgets/custom_button.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_container.dart';
import 'package:flutter_application_1/src/common/widgets/custom_navigation_text.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field_password.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: CupertinoNavigationBar(
        middle: CustomNavigationText(text: 'Регистрация'),
        backgroundColor: AppColors.white,
        border: Border(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          CustomTextField(placeholder: 'Логин'),
          CustomContainer(),
          CustomTextField(placeholder: 'Телефон'),
          CustomContainer(),
          CustomTextField(placeholder: 'Почта'),
          CustomContainer(),
          CustomTextFieldPassword(placeholder: 'Пароль'),
          Spacer(),
          Padding(
            padding: AppPadings.verticalHorizontal,
            child: CustomButton(text: 'Создать Аккаунт', route: null),
          ),
        ],
      ),
    );
  }
}

