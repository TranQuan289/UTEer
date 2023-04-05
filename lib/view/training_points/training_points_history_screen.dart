import 'package:flutter/material.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_empty_screen.dart';

class TrainingPointsHistoryScreen extends StatefulWidget {
  const TrainingPointsHistoryScreen({Key? key}) : super(key: key);

  @override
  _TrainingPointsHistoryScreenState createState() => _TrainingPointsHistoryScreenState();
}

class _TrainingPointsHistoryScreenState extends State<TrainingPointsHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, 'Lịch sử điểm rèn luyện'),
        body: const UIEmptyScreen(
          iconAsset: AppAssets.icNoHistory,
          title: 'Chưa có lịch sử!',
          message:
              'Hiện tại bạn chưa có lần chấm điểm rèn luyện nào được thực hiện trên Ứng dụng UTEer!',
        ));
  }
}
