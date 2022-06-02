import 'package:flutter/cupertino.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFF3F4F6),
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Регистрация',
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 16,
          ),
          ),
        backgroundColor: CupertinoColors.white,
        border: Border(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          CupertinoTextField(
            style: TextStyle(
              color: CupertinoColors.black,
              fontSize: 16,
            ),
            placeholder: 'Логин',
            placeholderStyle: TextStyle(
              color: Color(0xFFC3C3C3),
              fontSize: 16,
            ),
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
            ),
          ),

          Container(
            height: 1,
            color: Color(0xFFE0E6ED),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),

          CupertinoTextField(
            style: TextStyle(
              color: CupertinoColors.black,
              fontSize: 16,
            ),
            placeholder: 'Телефон',
            placeholderStyle: TextStyle(
              color: Color(0xFFC3C3C3),
              fontSize: 16,
            ),
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
            ),
          ),

          Container(
            height: 1,
            color: Color(0xFFE0E6ED),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),

          CupertinoTextField(
            style: TextStyle(
              color: CupertinoColors.black,
              fontSize: 16,
            ),
            placeholder: 'Почта',
            placeholderStyle: TextStyle(
              color: Color(0xFFC3C3C3),
              fontSize: 16,
            ),
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
            ),
          ),

          Container(
            height: 1,
            color: Color(0xFFE0E6ED),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),

          CupertinoTextField(
            style: TextStyle(
              color: CupertinoColors.black,
              fontSize: 16,
            ),
            placeholder: 'Пароль',
            placeholderStyle: TextStyle(
              color: Color(0xFFC3C3C3),
              fontSize: 16,
            ),
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
            ),
          ),
          Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 56),
            child:CupertinoButton(
              child: Text(
                'Создать Аккаунт',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.white,
                ),
                ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: Color(0xFF4631D2),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}