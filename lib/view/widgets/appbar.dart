import 'package:flutter/material.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/widgets/ui_back_button.dart';

AppBar appBar(BuildContext context, String title,
        {bool leading = true, List<Widget> actions = const []}) =>
    AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundAppBarHome),
            fit: BoxFit.cover,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      leading: leading
          ? UIBackButton(
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox.shrink(),
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(fontSize: DimensManager.dimens.setSp(18), fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      actions: actions,
    );
