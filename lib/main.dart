import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screens/auth/auth_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: AuthScreen(),
    );
  }
}
