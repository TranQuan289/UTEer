import 'package:flutter/material.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_empty_png_screen.dart';

class EncouragingStudyScreen extends StatefulWidget {
  const EncouragingStudyScreen({Key? key}) : super(key: key);

  @override
  _EncouragingStudyScreenState createState() => _EncouragingStudyScreenState();
}

class _EncouragingStudyScreenState extends State<EncouragingStudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Học bổng học tập'),
      body: const UIEmptyPngScreen(
        iconAsset: AppAssets.icScholarShip1,
        title: 'Chưa có danh sách học bổng nào!',
        message: 'Hiện tại chưa có danh sách học bổng nào.\nVui lòng kiểm tra lại sau!',
      ),
    );
  }
}
