import 'package:flutter/material.dart';
import 'package:futsoul_merchant/utils/constants/colors.dart';
import 'package:futsoul_merchant/utils/constants/custom_text_styles.dart';
import 'package:futsoul_merchant/utils/constants/image_path.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImagePath.noData),
        Text(
          "No Data to show",
          style: CustomTextStyles.f24W600(color: AppColors.primaryColor),
        )
      ],
    );
  }
}
