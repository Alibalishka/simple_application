import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_text_field.dart';

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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  return Container(
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
                            height: 94,
                            color: AppColors.buttonBackground,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Text('Esenetai Mall', 
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Flexible(
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          strutStyle: StrutStyle(fontSize: 12.0),
                                          text: TextSpan(
                                            text: 'Один из крупнейших торговых центров в'
                                          ),
                                        ),
                                      ),
                                      Text(''),
                                      Text('Esenetai Mall'),
                                    ],
                                  )
                                ),
                                Container(
                                  child: Icon(CupertinoIcons.heart_fill, color: CupertinoColors.systemRed),
                                )
                                
                              ],
                            ),
                          ),
                        ),                        
                      ],
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