import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/widgets/custom_box_shadow.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.text,
    required this.count,
    required this.icon,
     this.color = AppColors.darkBlue,
  });
  final String text;
  final String count;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.myWhite,
        boxShadow: [
          customBoxShadow()
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100,
      height: 120,
      child:Padding(
        padding:const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, color: color),
            // Image.asset(AppImages.splashImage,width: 50,),
            Text(text,style: AppStyle.lemon300Style12Grey.copyWith(
              fontSize: 14
            ),),
            Text(count,style: AppStyle.lemon500Style20.copyWith(
              fontSize:  16,
              fontWeight: FontWeight.w300
            ),),
          ],
        ),
      ),
    );
  }
}
