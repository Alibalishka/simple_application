import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_navigation_text.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: CupertinoNavigationBar(
        middle: CustomNavigationText(text: 'Профиль'),
        backgroundColor: AppColors.white,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            Icon(CupertinoIcons.profile_circled,
              size: 100,
              color: AppColors.black,
            ),
            SizedBox(height: 5),
            Text('Tokhtarbay Ali',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 8),
            Text('groznyi.alik@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.gray,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index){
                  return CustomButtonWidget();
                },
                separatorBuilder: (BuildContext context, int index){
                  return Divider();
                },
              ),
            ),
          ],
        ) 
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: CupertinoButton(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Выйти',
            style: TextStyle(
              color: CupertinoColors.systemRed,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 25),
        color: AppColors.white, 
        onPressed: (){}
      ),
    );
  }
}