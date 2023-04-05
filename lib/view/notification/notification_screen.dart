import 'package:flutter/material.dart' hide Notification;
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/view/widgets/appbar.dart';

import '../widgets/ui_empty_screen.dart';

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
        body: const UIEmptyScreen(
          iconAsset: AppAssets.icNoNotification,
          title: 'Chưa có thông báo nào!',
        ));
  }
}
