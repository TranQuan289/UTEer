import 'package:flutter/material.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_empty_png_screen.dart';

class UteScholarshipScreen extends StatefulWidget {
  const UteScholarshipScreen({Key? key}) : super(key: key);

  @override
  _UteScholarshipScreenState createState() => _UteScholarshipScreenState();
}

class _UteScholarshipScreenState extends State<UteScholarshipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Học bổng UTEs'),
      body: const UIEmptyPngScreen(
        iconAsset: AppAssets.icScholarShip2,
        title: 'Chưa có danh sách học bổng nào!',
        message: 'Hiện tại chưa có danh sách học bổng nào.\nVui lòng kiểm tra lại sau!',
      ),
    );
  }
}
