import 'package:flutter/material.dart' hide Notification;
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/notification/widget/notification_item_widget.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_search_input.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(context, 'Thông báo', leading: false),
      body: Column(children: [
        const UISearchInput(),
        Container(
          color: AppColors.white,
          padding: EdgeInsets.only(
              left: DimensManager.dimens.setWidth(16),
              right: DimensManager.dimens.setWidth(16),
              top: DimensManager.dimens.setHeight(20),
              bottom: DimensManager.dimens.setWidth(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '1 thông báo mới',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
              Text(
                'Đánh dấu đã đọc',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.primaryColor),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: AppColors.white,
            child: const SingleChildScrollView(
              child: SafeArea(
                child: NotificationItemWidget(),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
