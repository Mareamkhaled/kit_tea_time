import 'package:flutter/widgets.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class CustomSmallContainer extends StatelessWidget {
  const CustomSmallContainer({super.key, required this.text, required this.color});
  final String text; 
 final  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
          padding:const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: AppStyle.lemon300Style12Grey.copyWith(
              color: AppColors.myBlack
            )
          ),
        );
  }
}