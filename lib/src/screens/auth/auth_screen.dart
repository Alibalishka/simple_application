import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/widgets/custom_button.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_container.dart';
import 'package:flutter_application_1/src/common/widgets/custom_navigation_text.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field_password.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: CupertinoNavigationBar(
        middle: CustomNavigationText(text: 'Авторизация'),
        backgroundColor: AppColors.white,
        border: Border(),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(placeholder: 'Логин или почта'),
            CustomContainer(),
            CustomTextFieldPassword(placeholder: 'Пароль'),
            SizedBox(height: 32),
            Padding(
              padding: AppPadings.horizontal,
              child: CustomButton(text: 'Войти', route: null),
            ),
            SizedBox(height: 19),
            Padding(
              padding: AppPadings.horizontal,
              child: CustomButton(text: 'Зарегистрироваться', route: RegisterRoute),
            ),
          ],
        ),
      ),
    );
  }
}