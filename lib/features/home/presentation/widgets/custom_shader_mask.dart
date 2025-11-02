import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';

class CustomShaderMask extends StatelessWidget {
  const CustomShaderMask({super.key, required this.text, this.style});
 final String text;
 final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [AppColors.darkBlue, Color.fromARGB(255, 152, 239, 234)],
        tileMode: TileMode.clamp,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child:Text(
        text,
        style:style?? AppStyle.lemon700Style32.copyWith(
          color: Colors.white,
          fontSize: 20
      ),
    ));
  }
}
