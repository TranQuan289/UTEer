import 'package:flutter/material.dart';
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_outlined_button.dart';
import 'package:uteer/view/widgets/ui_text.dart';

class TrainingPointsScreen extends StatefulWidget {
  const TrainingPointsScreen({super.key});

  @override
  State<TrainingPointsScreen> createState() => _TrainingPointsScreenState();
}

class _TrainingPointsScreenState extends State<TrainingPointsScreen> {
  int trainingPoint1 = 0;
  int trainingPoint2 = 0;
  int trainingPoint3 = 0;
  int trainingPoint4 = 0;
  int trainingPoint5 = 0;
  int trainingPoint = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: appBar(context, 'Tự đánh giá điểm rèn luyện'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _TitleTrainingPoint(
                title: "I. ĐÁNH GIÁ VỀ Ý THỨC THAM GIA HỌC TẬP (20 điểm)",
              ),
              _DescriptionTrainingPoint(
                'Có đi học chuyên cần, đúng giờ, nghiêm túc trong giờ học; đủ điều kiện dự thi tất cả các học phần. (4 điểm)',
                score: 4,
                sumTrainingPoint: trainingPoint1,
              ),
              _DescriptionTrainingPoint(
                'Có ý thức tham gia các câu lạc bộ học thuật, các hoạt động học thuật, hoạt động ngoại khóa.	(2 điểm)',
                score: 2,
                sumTrainingPoint: trainingPoint1,
              ),
              _DescriptionTrainingPoint(
                "Có đăng ký, thực hiện, báo cáo đề tài NCKH đúng tiến độ hoặc đăng ký, tham dự kỳ thi sinh viên giỏi các cấp. (2 điểm)",
                score: 2,
                sumTrainingPoint: trainingPoint1,
              ),
              _DescriptionTrainingPoint(
                "Không vi phạm quy chế thi và kiểm tra.\n(6 điểm)",
                score: 6,
                sumTrainingPoint: trainingPoint1,
              ),
              _DescriptionTrainingPoint(
                "Được tập thể lớp công nhận có tinh thần vượt khó, phấn đấu vươn lên trong học tập.(2 điểm)",
                score: 2,
                sumTrainingPoint: trainingPoint1,
              ),
              _DescriptionTrainingPoint(
                isRadio: true,
                "ĐTBCHK từ 3,2 đến 4,0: (4 điểm)\nĐTBCHK từ 2,0 đến 3,19: (2 điểm)\nĐTBCHK dưới 2,0: (0 điểm)",
                score: 0,
                sumTrainingPoint: trainingPoint1,
              ),
              _SumGrade(description: "Cộng mục I:", sumTraningPoint: trainingPoint1),
              const _TitleTrainingPoint(
                  title:
                      "II. ĐÁNH GIÁ VỀ Ý THỨC CHẤP HÀNH NỘI QUY, QUY CHẾ TRONG NHÀ TRƯỜNG (25 điểm)"),
              _DescriptionTrainingPoint(
                'Có ý thức chấp hành các văn bản chỉ đạo của ngành, cấp trên và ĐHĐN được thực hiện trong nhà trường. (6 điểm)',
                score: 6,
                sumTrainingPoint: trainingPoint2,
              ),
              _DescriptionTrainingPoint(
                'Có ý thức tham gia đầy đủ, đạt yêu cầu các cuộc vận động, sinh hoạt chính trị theo chủ trương, của cấp trên, ĐHĐN và nhà trường. \n(4 điểm)',
                score: 4,
                sumTrainingPoint: trainingPoint2,
              ),
              _DescriptionTrainingPoint(
                "Có ý thức chấp hành nội quy, quy chế và các quy định của nhà trường. (10 điểm)",
                score: 10,
                sumTrainingPoint: trainingPoint2,
              ),
              _DescriptionTrainingPoint(
                "Đóng học phí và các khoản thu khác đầy đủ, đúng hạn. (5 điểm)",
                score: 5,
                sumTrainingPoint: trainingPoint2,
              ),
              _SumGrade(
                description: "Cộng mục II:",
                sumTraningPoint: trainingPoint2,
              ),
              const _TitleTrainingPoint(
                  title:
                      "III. ĐÁNH GIÁ VỀ Ý THỨC THAM GIA CÁC HOẠT ĐỘNG CHÍNH TRỊ- XÃ HỘI, VHVN, TDTT, PHÒNG CHỐNG TỘI PHẠM VÀ CÁC TỆ NẠN XÃ HỘI (20 điểm)"),
              _DescriptionTrainingPoint(
                "Tham gia đầy đủ, đạt yêu cầu “ Tuần sinh hoạt công dân sinh viên” đầu khóa năm học và cuối khóa.(10 điểm)",
                score: 10,
                sumTrainingPoint: trainingPoint3,
              ),
              _DescriptionTrainingPoint(
                "Có ý thức tham gia đầy đủ, nghiêm túc hoạt động rèn luyện về chính trị, xã hội, văn hóa, văn nghệ, thể thao do nhà trường và ĐHĐN tổ chức, điều động.(6 điểm)",
                score: 6,
                sumTrainingPoint: trainingPoint3,
              ),
              _DescriptionTrainingPoint(
                "Có ý thức tham gia các hoạt động công ích, tình nguyện, công tác xã hội trong nhà trường.	(2 điểm)",
                score: 2,
                sumTrainingPoint: trainingPoint3,
              ),
              _DescriptionTrainingPoint(
                "Có ý thức tuyên truyền, phòng chống tội phạm và các tệ nạn xã hội.(2 điểm)",
                score: 2,
                sumTrainingPoint: trainingPoint3,
              ),
              _SumGrade(
                description: "Cộng mục III:",
                sumTraningPoint: trainingPoint3,
              ),
              const _TitleTrainingPoint(
                  title: "IV. ĐÁNH GIÁ VỀ Ý THỨC CÔNG DÂN TRONG QUAN HỆ VỚI CỘNG ĐỒNG (25 điểm)"),
              _DescriptionTrainingPoint(
                "Có ý thức chấp hành, tham gia tuyên truyền các chủ trương của Đảng, chính sách, pháp luật của Nhà nước:(4 điểm)",
                score: 4,
                sumTrainingPoint: trainingPoint4,
              ),
              _DescriptionTrainingPoint(
                "Có tham gia bảo hiểm y tế ( bắt buộc) theo Luật bảo hiểm y tế.(10 điểm)",
                score: 10,
                sumTrainingPoint: trainingPoint4,
              ),
              _DescriptionTrainingPoint(
                "Có ý thức chấp hành, tham gia tuyên truyền các quy định về đảm bảo an toàn giao thông và “văn hóa giao thông”.\n(5 điểm)",
                score: 5,
                sumTrainingPoint: trainingPoint4,
              ),
              _DescriptionTrainingPoint(
                "Có ý thức tham gia các hoạt động xã hội có thành tích được ghi nhận, biểu dương khen thưởng.(4 điểm)",
                score: 4,
                sumTrainingPoint: trainingPoint4,
              ),
              _DescriptionTrainingPoint(
                "Có tinh thần chia sẻ, giúp đỡ người gặp khó khăn, hoạn nạn.(2 điểm)",
                score: 2,
                sumTrainingPoint: trainingPoint4,
              ),
              _SumGrade(
                description: "Cộng mục IV:",
                sumTraningPoint: trainingPoint4,
              ),
              const _TitleTrainingPoint(
                  title:
                      "V. ĐÁNH GIÁ VỀ Ý THỨC VÀ KẾT QUẢ KHI THAM GIA CÔNG TÁC CÁN BỘ LỚP, CÁC ĐOÀN THỂ, TỔ CHỨC TRONG NHÀ TRƯỜNG HOẶC SINH VIÊN ĐẠT ĐƯỢC THÀNH TÍCH TRONG HỌC TẬP, RÈN LUYỆN (10 điểm)"),
              _DescriptionTrainingPoint(
                "Có ý thức, uy tín và hoàn thành tốt nhiệm vụ quản lý lớp, các tổ chức Đảng, Đoàn Thanh niên, Hội Sinh viên, tổ chức khác trong nhà trường.(3 điểm)",
                score: 3,
                sumTrainingPoint: trainingPoint5,
              ),
              _DescriptionTrainingPoint(
                "Có kỹ năng tổ chức, quản lý lớp, các tổ chức Đảng, Đoàn Thanh niên, Hội Sinh viên và các tổ chức khác trong nhà trường.(2 điểm)",
                score: 2,
                sumTrainingPoint: trainingPoint5,
              ),
              _DescriptionTrainingPoint(
                "Hỗ trợ tham gia tích cực vào các hoạt động chung của lớp, tập thể khoa, trường và Đại học Đà Nẵng.(3 điểm)",
                score: 3,
                sumTrainingPoint: trainingPoint5,
              ),
              _DescriptionTrainingPoint(
                "Đạt thành tích trong học tập, rèn luyện (được tặng bằng khen, giấy khen, chứng nhận, thư khen của các cấp).(2 điểm)",
                score: 2,
                sumTrainingPoint: trainingPoint5,
              ),
              _SumGrade(
                description: "Cộng mục V:",
                sumTraningPoint: trainingPoint5,
              ),
              _SumGrade(
                description: "Tổng điểm:",
                sumTraningPoint: trainingPoint,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: UIOutlineButton(title: 'Nộp điểm'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DescriptionTrainingPoint extends StatefulWidget {
  _DescriptionTrainingPoint(this.description,
      {this.isRadio = false, required this.sumTrainingPoint, required this.score});
  final String description;
  final bool isRadio;
  int sumTrainingPoint;
  final int score;
  @override
  _DescriptionTrainingPointState createState() => _DescriptionTrainingPointState();
}

class _DescriptionTrainingPointState extends State<_DescriptionTrainingPoint> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  Object? radioValue1;
  Object? radioValue2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  color: const Color(0xff757575),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (widget.isRadio) ...[
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(width: 20),
                                  Column(
                                    children: const [
                                      SizedBox(height: 25),
                                      UIText('Sinh viên',
                                          color: AppColors.black, fontWeight: FontWeight.w400),
                                      SizedBox(height: 30),
                                      UIText('Giáo viên',
                                          color: AppColors.errorMsg, fontWeight: FontWeight.w400),
                                      SizedBox(height: 13),
                                    ],
                                  ),
                                  const SizedBox(width: 30),
                                  Column(
                                    children: [
                                      const UIText('3.2-4.0',
                                          color: AppColors.black, fontWeight: FontWeight.w400),
                                      Radio(
                                        value: 1,
                                        groupValue: radioValue1,
                                        onChanged: (newValue) {
                                          setState(() {
                                            radioValue1 = newValue;
                                            widget.sumTrainingPoint += 4;
                                          });
                                        },
                                      ),
                                      Radio(
                                        activeColor: AppColors.errorMsg,
                                        value: 1,
                                        groupValue: radioValue2,
                                        onChanged: (newValue) {
                                          setState(() {
                                            radioValue2 = newValue;
                                            widget.sumTrainingPoint += 4;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    children: [
                                      const UIText('2.0-3.19',
                                          color: AppColors.black, fontWeight: FontWeight.w400),
                                      Radio(
                                        value: 2,
                                        groupValue: radioValue1,
                                        onChanged: (newValue) {
                                          setState(() {
                                            radioValue1 = newValue;
                                            widget.sumTrainingPoint += 2;
                                          });
                                        },
                                      ),
                                      Radio(
                                        activeColor: AppColors.errorMsg,
                                        value: 2,
                                        groupValue: radioValue2,
                                        onChanged: (newValue) {
                                          setState(() {
                                            widget.sumTrainingPoint += 2;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    children: [
                                      const UIText('<2.0',
                                          color: AppColors.black, fontWeight: FontWeight.w400),
                                      Radio(
                                        value: 3,
                                        groupValue: radioValue1,
                                        onChanged: (newValue) {
                                          setState(() {
                                            radioValue1 = newValue;
                                            widget.sumTrainingPoint += 0;
                                          });
                                        },
                                      ),
                                      Radio(
                                        activeColor: AppColors.errorMsg,
                                        value: 3,
                                        groupValue: radioValue2,
                                        onChanged: (newValue) {
                                          setState(() {
                                            radioValue2 = newValue;
                                            widget.sumTrainingPoint += 0;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ] else ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: checkboxValue1,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkboxValue1 = newValue!;
                                    widget.sumTrainingPoint += widget.score;
                                  });
                                },
                              ),
                              const UIText('Sinh viên',
                                  color: AppColors.black, fontWeight: FontWeight.w400),
                              const SizedBox(width: 20),
                              Checkbox(
                                activeColor: AppColors.errorMsg,
                                value: checkboxValue2,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkboxValue2 = newValue!;
                                    widget.sumTrainingPoint += widget.score;
                                  });
                                },
                              ),
                              const UIText(
                                'Giáo viên',
                                color: AppColors.errorMsg,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                UIText(''),
                                SizedBox(
                                  height: 10,
                                ),
                                UIText('Cộng mục I:'),
                                SizedBox(
                                  height: 10,
                                ),
                                UIText('Cộng mục II:'),
                                SizedBox(
                                  height: 10,
                                ),
                                UIText('Cộng mục III:'),
                                SizedBox(
                                  height: 10,
                                ),
                                UIText('Cộng mục IV:'),
                                SizedBox(
                                  height: 10,
                                ),
                                UIText('Cộng mục V:'),
                                SizedBox(
                                  height: 10,
                                ),
                                UIText('Tổng điểm:'),
                              ],
                            ),
                            Column(
                              children: [
                                const UIText('Sinh viên'),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const UIText(
                                  'Chưa chấm',
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const UIText('Giáo viên'),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UIText(
                                  "${widget.sumTrainingPoint}",
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.enableBlue,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 5,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text(
              widget.description,
              style:
                  TextStyle(fontSize: DimensManager.dimens.setSp(16), fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleTrainingPoint extends StatelessWidget {
  const _TitleTrainingPoint({
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.blue,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: UIText(
            color: Colors.white,
            title,
            style: TextStyle(fontSize: DimensManager.dimens.setSp(17), fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

class _SumGrade extends StatelessWidget {
  const _SumGrade({
    required this.description,
    required this.sumTraningPoint,
  });
  final String description;
  final int sumTraningPoint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: UIText(
              description,
              style:
                  TextStyle(fontSize: DimensManager.dimens.setSp(16), fontWeight: FontWeight.w800),
            ),
          ),
          UIText(
            "$sumTraningPoint",
            fontWeight: FontWeight.w800,
          ),
        ],
      ),
    );
  }
}
