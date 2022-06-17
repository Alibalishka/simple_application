import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/router/router.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/auth/auth_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AuthRoute,
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        barBackgroundColor: AppColors.white,
      ),
    );
  }
}
