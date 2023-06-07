import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uteer/models/training_point_model.dart';
import 'package:uteer/models/user_model.dart';
import 'package:uteer/repository/training_point_repository.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/utils/general_utils.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/view/training_points/widget/training_point_card.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_empty_png_screen.dart';
import 'package:uteer/view/widgets/ui_outlined_button.dart';
import 'package:uteer/view/widgets/ui_search_input.dart';
import 'package:uteer/viewmodels/training_point/training_point_viewmodel.dart';

class TrainingPointsGvcnScreen extends StatefulWidget {
  const TrainingPointsGvcnScreen({Key? key}) : super(key: key);

  @override
  _TrainingPointsGvcnScreenState createState() => _TrainingPointsGvcnScreenState();
}

class _TrainingPointsGvcnScreenState extends State<TrainingPointsGvcnScreen> {
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
        appBar: appBar(context, 'Danh sách sinh viên điểm rèn luyện'),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              width: DimensManager.dimens.setWidth(390),
              height: DimensManager.dimens.setHeight(48),
              child: UISearchInput(
                onChangeValue: (String value) => null,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: DimensManager.dimens.setHeight(14),
                  horizontal: DimensManager.dimens.setWidth(14),
                ),
                child: Selector<TrainingPointViewModel, List<TrainingPointModel?>?>(
                  selector: (_, viewModel) => viewModel.listTrainingPoint,
                  builder: (context, listTrainingPoint, child) {
                    if (listTrainingPoint?.isNotEmpty ?? false) {
                      List<TrainingPointModel?> falseStatusList = [];
                      List<TrainingPointModel?> trueStatusList = [];

                      for (var item in listTrainingPoint!) {
                        if (item?.status == false) {
                          falseStatusList.add(item);
                        } else {
                          trueStatusList.add(item);
                        }
                      }

                      // Kết hợp hai danh sách thành một danh sách mới
                      List<TrainingPointModel?> combinedList = [
                        ...falseStatusList,
                        ...trueStatusList
                      ];

                      return ListView.builder(
                        itemCount: combinedList.length,
                        itemBuilder: (context, index) {
                          final trainingPoint = combinedList[index];
                          final email = trainingPoint?.email ?? "";

                          return FutureBuilder<UsersModel?>(
                            future: viewModel.getUser(email),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }

                              if (snapshot.hasError) {
                                return Text('Đã xảy ra lỗi: ${snapshot.error}');
                              }

                              final user = snapshot.data;

                              if (trainingPoint?.history == true && user != null) {
                                return InkWell(
                                  onTap: () {
                                    if (trainingPoint?.status == false) {
                                      Routes.goToTrainingPointGvcnDetailScreen(context, arguments: {
                                        "email": email,
                                        "absorbing": false,
                                      });
                                    } else {
                                      Utils.showPopup(
                                        context,
                                        icon: AppAssets.icCheck,
                                        title: 'Bạn đã duyệt sinh viên này rồi',
                                        message:
                                            'Bạn đã duyệt sinh viên này rồi\n Bạn có muốn chỉnh lại không?',
                                        action: Row(children: [
                                          Flexible(
                                              child: UIOutlineButton(
                                            title: 'Huỷ',
                                            onPressed: () => Navigator.of(context).pop(),
                                          )),
                                          SizedBox(
                                            width: DimensManager.dimens.setWidth(16),
                                          ),
                                          Flexible(
                                              child: UIOutlineButton(
                                                  title: 'Chỉnh lại',
                                                  backgroundColor: AppColors.primaryColor,
                                                  titleStyle: const TextStyle(color: Colors.white),
                                                  onPressed: () {
                                                    Routes.goToTrainingPointGvcnDetailScreen(
                                                        context,
                                                        arguments: {
                                                          "email": email,
                                                          "absorbing": false,
                                                        });

                                                    Navigator.of(context).pop();
                                                  }))
                                        ]),
                                      );
                                    }
                                  },
                                  child: TrainingPointCard(
                                    name: user.name ?? "",
                                    score: trainingPoint?.status ?? false
                                        ? trainingPoint?.teacherTrainingPoint ?? 0
                                        : trainingPoint?.trainingPoint ?? 0,
                                    rank: trainingPoint?.status ?? false
                                        ? trainingPoint?.teacherRank ?? ""
                                        : trainingPoint?.rank ?? "",
                                    semester: viewModel.openTrainingPoint?.semester ?? "",
                                    status: trainingPoint?.status ?? false,
                                  ),
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
                            title: "Hiện chưa có danh sách điểm rèn luyện nào",
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
