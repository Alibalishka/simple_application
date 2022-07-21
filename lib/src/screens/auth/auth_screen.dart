import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/models/tokens_model.dart';
import 'package:flutter_application_1/src/common/models/user_model.dart';
import 'package:flutter_application_1/src/common/widgets/custom_button.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_container.dart';
import 'package:flutter_application_1/src/common/widgets/custom_navigation_text.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field_password.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:flutter_application_1/src/screens/mainScreen/main_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              child:BlocConsumer<LogInBloc, LogInState>(
                listener: (context, state){
                  if(state is LogInLoaded){
                    // Переходим на страницу MainScreen, если пользователь успешно авторизовался
                    Navigator.pushReplacementNamed(context, MainRoute);
                  }else if(state is LogInFailed){
                    showCupertinoModalPopup(
                      context: context, 
                      builder: (context){
                        return CupertinoAlertDialog(
                          title: Text('Ошибка'),
                          content: Text(state.errMessage ?? ''),
                          actions: [
                            CupertinoButton(
                              child: Text('OK'), 
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      } 
                    );
                  }
                },
                builder: (context, state){
                  return CustomButton(
                    text: 'Войти',
                    onPressed: state is LogInLoading ? null : (){
                      context.read<LogInBloc>().add(
                        LogInPressed(
                          email: emailController.text, 
                          password: passwordController.text,
                        ),
                      );
                    }
                  );
                },
              )
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