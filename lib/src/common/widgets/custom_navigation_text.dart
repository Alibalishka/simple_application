import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';

class CustomNavigationText extends StatelessWidget {
  
  final String? text;

  const CustomNavigationText({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        text!,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 15,
        ),
      );
  }
}