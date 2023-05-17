import 'package:flutter/material.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_dropdown_input.dart';
import 'package:uteer/view/widgets/ui_search_input.dart';
import 'package:uteer/view/widgets/ui_text.dart';

class EncouragingStudyScreen extends StatefulWidget {
  const EncouragingStudyScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EncouragingStudyScreenState createState() => _EncouragingStudyScreenState();
}

class _EncouragingStudyScreenState extends State<EncouragingStudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, 'Học bổng học tập'),
        body: Column(children: [
          Container(
              color: Colors.white,
              width: DimensManager.dimens.setWidth(390),
              height: DimensManager.dimens.setHeight(48),
              child: const UISearchInput()),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Flexible(
                child: UIDropdownInput(
                  title: "Lớp",
                  hint: "Chọn",
                  list: const ["Tất cả", "19T2", "19T1"],
                  initValue: "Tất cả",
                  onChanged: (String? val) {
                    if (val != null) {}
                  },
                ),
              ),
              SizedBox(
                width: DimensManager.dimens.setWidth(10),
              ),
              Flexible(
                child: UIDropdownInput(
                  title: "Xếp loại học bổng",
                  hint: "Chọn",
                  list: const ["Tất cả", "Xuất Xắc", "Giỏi", "Khá"],
                  initValue: "Tất cả",
                  onChanged: (p0) => null,
                ),
              ),
            ]),
          ),
          const UIText("HỌC KỲ I NĂM HỌC 2022-2023"),
          Column(
            children: [
              Row(
                children: const [],
              )
            ],
          )
        ]));
  }
}
