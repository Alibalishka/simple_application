import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/detail/detail_screen.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
              child:SearchTextField(),
            ),
            
            Expanded(
              child: ListView.separated(
                padding: AppPadings.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: () => Navigator.of(context, rootNavigator: true).pushNamed(RestaurantDetailRoute),
                    child: Container(
                      height: 234,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset('assets/images/esentai.png',
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                              height: 140,
                            ),
                          ),
                          
                          Padding( 
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Container(
                              width: double.infinity,
                              height: 94,
                              // color: AppColors.buttonBackground,
                              child: Row(
                                children: [ 
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Esentai Mall',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20,
                                          ),
                                        ),
                                        CustomStoriesText(text: 'Один из крупнейших торговых центров в городе'),
                                        CustomStoriesText(text: 'Аль-Фараби'),
                                      ],
                                    )
                                  ),
                                  Icon(CupertinoIcons.heart_fill, color: CupertinoColors.systemRed, size: 30,),
                                ],
                              ),
                            ),
                          ),                        
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index){
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomStoriesText extends StatelessWidget {
  final String? text;
  const CustomStoriesText({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text!,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: AppColors.gray,
      fontSize: 14,
    ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      style: TextStyle(
        color: AppColors.black,
        fontSize: 16,
      ),
      placeholder: 'Поиск',
      placeholderStyle: TextStyle(
        color: AppColors.gray,
        fontSize: 16,
      ),
      itemColor: AppColors.gray,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      prefixInsets: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }
}