import 'package:flutter/material.dart';
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/widgets/ui_text.dart';

class UITextButton extends StatelessWidget {
  const UITextButton(
      {required this.text, this.color = AppColors.primaryColor, this.onPressed, super.key});
  final String text;
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: UIText(
        text,
        decoration: TextDecoration.underline,
        color: color,
        size: DimensManager.dimens.setSp(14),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
