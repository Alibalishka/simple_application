import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_navigation_text.dart';
import 'package:flutter_application_1/src/common/widgets/custom_padding.dart';
import 'package:flutter_application_1/src/router/routing_const.dart';
import 'package:flutter_application_1/src/screens/stories/stories_screen.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: CupertinoNavigationBar(
        middle: CustomNavigationText(text: 'Избранные'),
        backgroundColor: AppColors.white,
        border: Border(),
      ),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                padding: AppPadings.horizontal,
                itemCount: 1,
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
        )
      ),
    );
  }
}