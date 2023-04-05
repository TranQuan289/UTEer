import 'package:flutter/material.dart';

import '../../res/constant/app_assets.dart';
import '../../res/style/app_colors.dart';
import '../../utils/dimens/dimens_manager.dart';

enum ActiveRead { received, sent, unRead, none }

class StatusAvatar extends StatelessWidget {
  const StatusAvatar({
    super.key,
    required this.activeStatus,
    required this.sizeMax,
  });

  final bool activeStatus;
  final bool sizeMax;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: DimensManager.dimens.setHeight(8),
        bottom: DimensManager.dimens.setHeight(8),
        left: DimensManager.dimens.setWidth(16),
      ),
      child: Stack(children: [
        CircleAvatar(
          radius: sizeMax ? 30.0 : 20.0,
          backgroundImage: const AssetImage(AppAssets.avatar),
          child: Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: sizeMax ? 8.0 : 6.0,
              child: Icon(
                Icons.brightness_1,
                size: sizeMax ? 12.0 : 10.0,
                color: activeStatus ? AppColors.activeChat : AppColors.inActiveChat,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

Icon dotStatus(status) {
  switch (status) {
    case ActiveRead.received:
      return const Icon(Icons.brightness_1, color: AppColors.primaryColor, size: 12);

    case ActiveRead.sent:
      return const Icon(Icons.check_circle, color: AppColors.hintTextColor, size: 12);

    case ActiveRead.unRead:
      return const Icon(Icons.check_circle_outline, color: AppColors.hintTextColor, size: 12);
  }
  return const Icon(null);
}
