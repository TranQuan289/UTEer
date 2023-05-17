import 'package:flutter/material.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/training_points/widget/training_point_history_card.dart';
import 'package:uteer/view/widgets/appbar.dart';

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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: DimensManager.dimens.setHeight(14),
              horizontal: DimensManager.dimens.setWidth(14),
            ),
            child: Column(
              children: const [
                BloodResultCard(
                  schoolYear: '2021 - 2022',
                  score: '86',
                  rank: 'Giỏi',
                  selfScoringScore: '90',
                  teacherGrade: '86',
                  scorer: 'Hoàng Thị Mỹ Lệ',
                  semester: 'II',
                ),
                BloodResultCard(
                  schoolYear: '2021 - 2022',
                  score: '86',
                  rank: 'Giỏi',
                  selfScoringScore: '88',
                  teacherGrade: '86',
                  scorer: 'Hoàng Thị Mỹ Lệ',
                  semester: 'I',
                ),
                BloodResultCard(
                  schoolYear: '2020 - 2021',
                  score: '90',
                  rank: 'Xuất Xắc',
                  selfScoringScore: '90',
                  teacherGrade: '90',
                  scorer: 'Hoàng Thị Mỹ Lệ',
                  semester: 'II',
                ),
              ],
            ),
          ),
        ));
  }
}
