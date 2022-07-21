import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/widgets/custom_button.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_container.dart';
import 'package:flutter_application_1/src/common/widgets/custom_navigation_text.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field_password.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/register/bloc/reg_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isVisible = true;

  Dio dio = Dio();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          CustomTextField(placeholder: 'Имя', controller: nameController),
          CustomContainer(),
          CustomTextField(placeholder: 'Телефон', controller: phoneController),
          CustomContainer(),
          CustomTextField(placeholder: 'Почта', controller: emailController),
          CustomContainer(),
          CustomTextFieldPassword(placeholder: 'Пароль', controller: passwordController),
          Spacer(),
          Padding(
            padding: AppPadings.verticalHorizontal,
            child: BlocConsumer<RegInBloc, RegInState>(
              listener: (context, state){
                if(state is RegInLoaded){
                  Navigator.pushReplacementNamed(context, AuthRoute);
                }else if (state is RegInFailed){
                  showCupertinoModalPopup(
                    context: context, 
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Ошибка'),
                        content: Text(state.errmessage ?? ''),
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
                  text: 'Создать Аккаунт',
                  onPressed: state is RegInLoading ? null : (){
                    context.read<RegInBloc>().add(
                      RegInPressed(
                        name: nameController.text, 
                        phone: phoneController.text, 
                        email: emailController.text, 
                        password: passwordController.text,
                      ),
                    );
                  },
                );
              },
            )
          ),
        ],
      ),
    );
  }
}