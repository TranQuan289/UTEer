import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uteer/models/scholarship_model.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/scholarship/widget/scholarship_item.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_dropdown_input.dart';
import 'package:uteer/view/widgets/ui_search_input.dart';
import 'package:uteer/view/widgets/ui_text.dart';

class EncouragingStudyScreen extends StatefulWidget {
  const EncouragingStudyScreen({Key? key}) : super(key: key);

  @override
  _EncouragingStudyScreenState createState() => _EncouragingStudyScreenState();
}

class _EncouragingStudyScreenState extends State<EncouragingStudyScreen> {
  List<ScholarshipModel> scholarships = [];
  @override
  void initState() {
    super.initState();
    getScholarships();
  }

  Future<void> getScholarships() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('scholarship').get();
    final List<DocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;
    if (documents.isNotEmpty) {
      final List<ScholarshipModel> scholarships = documents.map((doc) {
        return ScholarshipModel.fromFirestore(doc, null);
      }).toList();
      setState(() {
        this.scholarships = scholarships;
      });
    } else {
      print('No scholarships');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Học bổng học tập'),
      body: Column(
        children: [
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
          Expanded(
            child: ListView.builder(
              itemCount: scholarships.length,
              itemBuilder: (context, index) {
                final scholarship = scholarships[index];
                return ScheduleItemWidget(scholarship); // your scholarship item widget
              },
            ),
          ),
        ],
      ),
    );
  }
}
