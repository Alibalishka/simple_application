import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/router/router.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/auth/auth_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  await Hive.initFlutter();
  // Создаем коробку tokens что-бы сохранить токены 
  await Hive.openBox('tokens');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Создаём переменную initialRoute, которую закидываем в CupertinoApp, и задаём изначальное значение AuthRoute
  String initialRoute = AuthRoute;
  
  @override
  void initState(){
    // Получаем Box токенов
    Box tokensBox = Hive.box('tokens');

    // Делаем проверку если access или refresh токены равны 'null'
    if(tokensBox.get('access') != null || tokensBox.get('refresh') != null){
      // Если пользователь авторизован, то меняем initialRoute на MainRoute
      initialRoute = MainRoute;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: initialRoute,
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        barBackgroundColor: AppColors.white,
      ),
    );
  }
}
