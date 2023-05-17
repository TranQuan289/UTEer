import 'package:flutter/material.dart' hide Notification;
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';

const kThumbnailSize = 56.0;

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Container(
        padding: EdgeInsets.all(DimensManager.dimens.setWidth(16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _buildThumbnail(),
            ),
            SizedBox(
              width: DimensManager.dimens.setWidth(16),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  const Text(
                    "Thông báo tất cả viên hoàn thành việc tự chấm điểm rèn luyện trước",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.gray),
                  ),
                  SizedBox(
                    height: DimensManager.dimens.setHeight(8),
                  ),
                  const Text(
                    "10 phút trước",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: AppColors.blue),
                  )
                ],
              ),
            ),
            // if (!notification.isRead)
            //   Padding(
            //     padding: const EdgeInsets.only(top: 8),
            //     child: SizedBox(
            //       width: 16,
            //       child: Container(
            //         width: 7,
            //         height: 7,
            //         decoration: const BoxDecoration(
            //             color: AppColors.primaryColor, shape: BoxShape.circle),
            //       ),
            //     ),
            //   )
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    return Image.asset(
      AppAssets.icTrainingPoint,
      width: DimensManager.dimens.setWidth(kThumbnailSize),
      height: DimensManager.dimens.setWidth(kThumbnailSize),
      fit: BoxFit.cover,
    );
  }
}

Widget _buildTitle() {
  return RichText(
    text: const TextSpan(
      text: "Thông báo",
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.primaryColor),
      children: <TextSpan>[
        TextSpan(
          text: ' về việc chấm điểm rèn luyện',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 15, color: AppColors.disableItemColor),
        ),
      ],
    ),
  );
}
