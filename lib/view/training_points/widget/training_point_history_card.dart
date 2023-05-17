import 'package:flutter/material.dart';
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/widgets/ui_outlined_button.dart';
import 'package:uteer/view/widgets/ui_text.dart';

const double kNormalHeight = 98.0;
const double kExpandedHeight = 237.0;

class BloodResultCard extends StatefulWidget {
  final String schoolYear;
  final String semester;
  final String score;
  final String rank;
  final String selfScoringScore;
  final String teacherGrade;
  final String scorer;
  const BloodResultCard({
    super.key,
    required this.schoolYear,
    required this.semester,
    required this.score,
    required this.rank,
    required this.selfScoringScore,
    required this.teacherGrade,
    required this.scorer,
  });

  @override
  State<BloodResultCard> createState() => _BloodResultCardState();
}

class _BloodResultCardState extends State<BloodResultCard> {
  double height = kNormalHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (height == kNormalHeight) {
            height = kExpandedHeight;
          } else {
            height = kNormalHeight;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16.0,
            ),
          ],
        ),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
          child: ClipPath(
            clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
            child: Stack(
              children: [
                AnimatedContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  duration: const Duration(milliseconds: 300),
                  height: height,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                          color: height != kNormalHeight
                              ? AppColors.primaryColor
                              : AppColors.enableBlue,
                          width: 8),
                    ),
                  ),
                  child: height != kNormalHeight
                      ? _buildExpandedInfo(widget.schoolYear, widget.semester, widget.score,
                          widget.rank, widget.selfScoringScore, widget.teacherGrade, widget.scorer)
                      : _buildShortInfo(
                          widget.schoolYear, widget.semester, widget.score, widget.rank),
                ),
                Positioned(
                  left: 4,
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: height,
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide(color: Colors.white, width: 10)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildShortInfo(String schoolYear, String semester, String score, String rank) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UIText(
                  "Năm học: $schoolYear",
                  style: const TextStyle(fontSize: 15, color: Color(0xFF434343)),
                ),
                Row(
                  children: [
                    UIText(
                      "Học kì: $semester",
                      style: const TextStyle(fontSize: 15, color: Color(0xFF434343)),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: DimensManager.dimens.setHeight(14),
            ),
            UIText(
              "Tổng điểm: $score",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
            const SizedBox(
              height: 8,
            ),
            UIText(
              "Xếp loại: $rank",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpandedInfo(String schoolYear, String semester, String score, String rank,
      String selfScoringScore, String teacherGrade, String scorer) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShortInfo(schoolYear, semester, score, rank),
          const SizedBox(
            height: 13,
          ),
          Row(
            children: [
              const UIText(
                "Điểm tự đánh giá: ",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
              ),
              UIText(
                selfScoringScore,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.primaryColor),
              ),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          Row(
            children: [
              const UIText(
                "Điểm giáo viên đánh giá: ",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
              ),
              UIText(
                teacherGrade,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.primaryColor),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          Row(
            children: [
              const UIText(
                "Giáo viên đánh giá: ",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
              ),
              UIText(
                scorer,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14, color: AppColors.primaryColor),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
                height: 40,
                width: 90,
                child: UIOutlineButton(
                  title: "Xem chi tiết",
                  onPressed: () {},
                )),
          )
        ],
      ),
    );
  }
}
