import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/dependencies/injection_container.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/auth/auth_screen.dart';
import 'package:flutter_application_1/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:flutter_application_1/src/screens/detail/detail_screen.dart';
import 'package:flutter_application_1/src/screens/mainScreen/main_screen.dart';
import 'package:flutter_application_1/src/screens/map/map_screen.dart';
import 'package:flutter_application_1/src/screens/profile/profile_screen.dart';
import 'package:flutter_application_1/src/screens/register/reg_screen.dart';
import 'package:flutter_application_1/src/screens/wishList/wish_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter{
  static Route generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LogInBloc(
              // Задали аргумент Dio, получаемый с getIt
              dio: getIt<Dio>(),
            ),
            child: AuthScreen(),
          ),
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
      case WishListRoute:
        return CupertinoPageRoute(
          builder: (context) => WishListScreen(),
        );
      case ProfileRoute:
        return CupertinoPageRoute(
          builder: (context) => ProfileScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
    }
  }
}