import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uteer/models/training_point_model.dart';
import 'package:uteer/repository/training_point_repository.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/training_points/widget/training_point_history_card.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_empty_png_screen.dart';
import 'package:uteer/viewmodels/training_point/training_point_viewmodel.dart';

class TrainingPointsHistoryScreen extends StatefulWidget {
  const TrainingPointsHistoryScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  _TrainingPointsHistoryScreenState createState() => _TrainingPointsHistoryScreenState();
}

class _TrainingPointsHistoryScreenState extends State<TrainingPointsHistoryScreen> {
  late String msv;
  late TrainingPointViewModel viewModel;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    viewModel = TrainingPointViewModel(repository: TrainingPointRepository());

    int atIndex = widget.email.indexOf('@');
    if (atIndex != -1) {
      msv = widget.email.substring(0, atIndex);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      viewModel.onInitView(context);
      await viewModel.getTrainingPoint(msv);
      await viewModel.getOpenTrainingPoint();
      await viewModel.getUser(widget.email);
      setState(() {
        isLoading = false;
      });
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
          child: isLoading
              ? _buildLoadingIndicator()
              : Selector<TrainingPointViewModel, TrainingPointModel?>(
                  selector: (_, viewModel) => viewModel.trainingPoint,
                  builder: (context, value, child) {
                    if (viewModel.trainingPoint?.history == true) {
                      return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) => BloodResultCard(
                          email: viewModel.user?.email ?? "",
                          rule: viewModel.user?.rule ?? "",
                          name: viewModel.user?.name ?? "",
                          score: viewModel.trainingPoint?.trainingPoint ?? 0,
                          rank: viewModel.trainingPoint?.rank ?? "",
                          selfScoringScore: viewModel.trainingPoint?.trainingPoint ?? 0,
                          teacherGrade: viewModel.trainingPoint?.trainingPoint ?? 0,
                          scorer: viewModel.trainingPoint?.gvcn ?? "",
                          semester: viewModel.openTrainingPoint?.semester ?? "",
                        ),
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

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(), // Hiển thị màn hình tải dữ liệu
    );
  }
}
