import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/auth/auth_screen.dart';
import 'package:flutter_application_1/src/screens/detail/detail_screen.dart';
import 'package:flutter_application_1/src/screens/mainScreen/main_screen.dart';
import 'package:flutter_application_1/src/screens/map/map_screen.dart';
import 'package:flutter_application_1/src/screens/register/reg_screen.dart';

class AppRouter{
  static Route generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) => Register(),
        );
      case MainRoute:
        return CupertinoPageRoute(
          builder: (context) => MainScreen(),
        );
      case RestaurantDetailRoute:
        return CupertinoPageRoute(
          builder: (context) => DetailScreen(),
        );
      case MapRoute:
        return CupertinoPageRoute(
          builder: (context) => MapScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
    }
  }
}