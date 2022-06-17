import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/widgets/custom_button.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_container.dart';
import 'package:flutter_application_1/src/common/widgets/custom_navigation_text.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field_password.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/mainScreen/main_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  
  bool isVisible = true;

  Dio dio = Dio();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CustomNavigationText(text: 'Авторизация'),
        border: Border(),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              placeholder: 'Логин или почта',
              controller: emailController,
            ),
            CustomContainer(),
            CustomTextFieldPassword(
              placeholder: 'Пароль',
              controller: passwordController,
            ),
            SizedBox(height: 32),
            Padding(
              padding: AppPadings.horizontal,
              child: CustomButton(
                text: 'Войти', 
                onPressed: () async{
                  try{
                  Response response = await dio.post(
                    'http://api.codeunion.kz/api/v1/auth/login',
                    data: {
                      'email': emailController.text,
                      'password': passwordController.text,
                    },
                  );
                  print(response.data);
                  Navigator.pushReplacementNamed(context, MainRoute);
                  } on DioError catch (e){
                    showCupertinoModalPopup(
                      context: context, 
                      builder: (context){
                        return CupertinoAlertDialog(
                          title: Text('Ошибка'),
                          content: Text('Неправильный логин или проль!'),
                          actions: [
                            CupertinoButton(
                              child: Text('OK'), 
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                    throw e;
                  }
                },
              ),
            ),
            SizedBox(height: 19),
            Padding(
              padding: AppPadings.horizontal,
              child: CustomButton(text: 'Зарегистрироваться', onPressed: () => Navigator.pushNamed(context, RegisterRoute)),
            ),
          ],
        ),
      ),
    );
  }
}