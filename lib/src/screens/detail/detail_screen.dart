import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';
import 'package:flutter_application_1/src/common/widgets/custom_navigation_text.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      navigationBar: TransparensNavigationBar(),
      
        child: SafeArea(
          child: Column(
            children: [
              ClipRRect(
                child: Image.asset('assets/images/esentai.png',
                fit: BoxFit.fill,
                width: double.infinity,
                height: MediaQuery.of(context).size.height/3.1,
                ),
                
              ),
            ],
          ),
        ),
      
    );
  }
}


class TransparensNavigationBar extends CupertinoNavigationBar{
    TransparensNavigationBar():super(
    backgroundColor: Colors.transparent,
    middle: CustomNavigationText(text: 'Esentai Mall'),
    border: Border(),
    trailing: GestureDetector(
      child: Icon(CupertinoIcons.heart),
      onTap: (){

      },
    )
  );
}
