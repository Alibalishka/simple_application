import 'package:flutter/cupertino.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFF3F4F6),
      navigationBar: CupertinoNavigationBar(
        middle: Text(
            'Авторизация',
            style: TextStyle(
              color: CupertinoColors.black,
              fontSize: 15,
            ),
          ),
        backgroundColor: CupertinoColors.white,
        border: Border(),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CupertinoTextField(
              style: TextStyle(
                color: CupertinoColors.black,
                fontSize: 16,
              ),
              placeholder: 'Логин или почта',
              placeholderStyle: TextStyle(
                color: Color(0xFFC3C3C3),
                fontSize: 16,
              ),
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFFFEFEFE),
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
                color: Color(0xFFFEFEFE),
              ),
            ),

            SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                child: Text(
                  'Войти',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 16,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: Color(0xFF4631D2),
                onPressed: () {},
              ),
            ),

            SizedBox(height: 19),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 16,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: Color(0xFF4631D2),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}