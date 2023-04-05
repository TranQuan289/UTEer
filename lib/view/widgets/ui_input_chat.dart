import 'package:flutter/material.dart';

import '../../res/style/app_colors.dart';
import '../../utils/dimens/dimens_manager.dart';

class UiInputChat extends StatelessWidget {
  const UiInputChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: DimensManager.dimens.setHeight(38),
        width: DimensManager.dimens.setWidth(250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.black.withOpacity(0.05),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                  fontSize: DimensManager.dimens.setSp(16),
                  color: AppColors.hintSendChat,
                  fontWeight: FontWeight.w400),
              hintText: "Nhập tin nhắn...",
            ),
          ),
        ));
  }
}
