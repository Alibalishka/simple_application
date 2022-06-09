import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/screens/auth/auth_screen.dart';
import 'package:flutter_application_1/src/screens/map/map_screen.dart';
import 'package:flutter_application_1/src/screens/register/reg_screen.dart';
import 'package:flutter_application_1/src/screens/stories/stories_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: AppColors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Лента'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.map), label: 'Карта'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: 'Избранные'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), label: 'Профиль'),
        ],
      ),
      tabBuilder: (context, index){
        return CupertinoTabView(
          builder: (context){
            switch (index) {
              case 0:
                return StoriesScreen();
              case 1:
                return MapScreen();
              case 2:
                return AuthScreen();
              case 3:
                return Register();
              default:
                return AuthScreen();
            }
          }
        );
      }
    );
  }
}