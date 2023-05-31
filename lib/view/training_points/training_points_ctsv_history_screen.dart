import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uteer/models/training_point_model.dart';
import 'package:uteer/models/user_model.dart';
import 'package:uteer/repository/training_point_repository.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/training_points/widget/training_point_history_card.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_empty_png_screen.dart';
import 'package:uteer/viewmodels/training_point/training_point_viewmodel.dart';

class TrainingPointsCtsvHistoryScreen extends StatefulWidget {
  const TrainingPointsCtsvHistoryScreen({Key? key}) : super(key: key);

  @override
  _TrainingPointsCtsvHistoryScreenState createState() => _TrainingPointsCtsvHistoryScreenState();
}

class _TrainingPointsCtsvHistoryScreenState extends State<TrainingPointsCtsvHistoryScreen> {
  late TrainingPointViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = TrainingPointViewModel(repository: TrainingPointRepository());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.onInitView(context);
      viewModel.getListTrainingPoint();
      viewModel.getOpenTrainingPoint();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: appBar(context, 'Lịch sử điểm rèn luyện'),
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: DimensManager.dimens.setHeight(14),
            horizontal: DimensManager.dimens.setWidth(14),
          ),
          child: Selector<TrainingPointViewModel, List<TrainingPointModel?>?>(
            selector: (_, viewModel) => viewModel.listTrainingPoint,
            builder: (context, listTrainingPoint, child) {
              if (listTrainingPoint?.isNotEmpty ?? false) {
                return ListView.builder(
                  itemCount: listTrainingPoint?.length,
                  itemBuilder: (context, index) {
                    final trainingPoint = listTrainingPoint?[index];
                    final email = trainingPoint?.email ?? "";

                    return FutureBuilder<UsersModel?>(
                      future: viewModel.getUser(email),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // Hiển thị một widget loading hoặc tiến trình chờ tại đây
                          return const CircularProgressIndicator();
                        }

                        if (snapshot.hasError) {
                          // Xử lý lỗi khi không thể lấy được thông tin người dùng
                          return Text('Đã xảy ra lỗi: ${snapshot.error}');
                        }

                        final user = snapshot.data;

                        if (trainingPoint?.history == true && user != null) {
                          return BloodResultCard(
                            email: user.email ?? "",
                            rule: "ctsv",
                            name: user.name ?? "",
                            score: trainingPoint?.trainingPoint ?? 0,
                            rank: trainingPoint?.rank ?? "",
                            selfScoringScore: trainingPoint?.trainingPoint ?? 0,
                            teacherGrade: viewModel.trainingPoint?.trainingPoint ?? 0,
                            scorer: trainingPoint?.gvcn ?? "",
                            semester: viewModel.openTrainingPoint?.semester ?? "",
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    );
                  },
                );
              } else {
                return Column(
                  children: const [
                    SizedBox(
                      height: 200,
                    ),
                    UIEmptyPngScreen(
                      iconAsset: AppAssets.icHistoryMini,
                      title: "Hiện chưa có lịch sử điểm rèn luyện nào",
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
