import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/common/widgets/custom_colors.dart';

class CustomButton extends StatelessWidget {

  final String? text;
  final String? route;

  const CustomButton({
    this.text,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(
        text!,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: AppColors.buttonBackground,
      onPressed: () {
        Navigator.pushNamed(context, route!);
      },
    );
  }
}