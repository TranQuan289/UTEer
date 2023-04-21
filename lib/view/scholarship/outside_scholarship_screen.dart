import 'package:flutter/material.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_empty_png_screen.dart';

class OutsideScholarshipScreen extends StatefulWidget {
  const OutsideScholarshipScreen({Key? key}) : super(key: key);

  @override
  _OutsideScholarshipScreenState createState() => _OutsideScholarshipScreenState();
}

class _OutsideScholarshipScreenState extends State<OutsideScholarshipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Học bổng từ bên ngoài'),
      body: const UIEmptyPngScreen(
        iconAsset: AppAssets.icScholarShip3,
        title: 'Chưa có danh sách học bổng nào!',
        message: 'Hiện tại chưa có danh sách học bổng nào.\nVui lòng kiểm tra lại sau!',
      ),
    );
  }
}
