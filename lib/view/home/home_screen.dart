import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uteer/models/user_model.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/utils/routes/routes_name.dart';

import '../../res/constant/app_assets.dart';
import '../../res/constant/app_fonts.dart';
import '../../res/style/app_colors.dart';
import '../../utils/dimens/dimens_manager.dart';
import '../widgets/ui_card.dart';
import '../widgets/ui_text.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  const HomeScreen({super.key, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Users? user;

  @override
  void initState() {
    super.initState();
    getUser(widget.email);
  }

  Future<void> getUser(String email) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('users').where('email', isEqualTo: email).get();
    final List<DocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;
    if (documents.isNotEmpty) {
      final Users user = Users.fromFirestore(documents.first, null);
      setState(() {
        this.user = user;
      });
    } else {
      print('No user found with email: $email');
    }
  }

  List imageList = [
    {"id": 1, "image_path": AppAssets.banner1},
    {"id": 2, "image_path": AppAssets.banner2},
    {"id": 3, "image_path": AppAssets.banner3}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leadingWidth: 78,
        toolbarHeight: 75,
        elevation: 0,
        leading: Row(
          children: [
            SizedBox(
              width: DimensManager.dimens.setWidth(16),
            ),
            CircleAvatar(
              radius: 25,
              child: Image.asset(
                AppAssets.avatar,
                width: DimensManager.dimens.setWidth(50),
                height: DimensManager.dimens.setWidth(50),
              ),
            ),
          ],
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText(
                  user?.name ?? "",
                  style: TextStyle(
                      fontSize: DimensManager.dimens.setSp(20),
                      color: Colors.white,
                      fontFamily: AppFonts.nunito,
                      fontWeight: FontWeight.w800),
                ),
                UIText(
                  user?.msv ?? "",
                  style: TextStyle(
                      fontSize: DimensManager.dimens.setSp(14),
                      color: Colors.white,
                      fontFamily: AppFonts.nunito,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.eye, AppColors.blue],
          )),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: DimensManager.dimens.setHeight(16)),
                  _slideBanner(),
                  const SizedBox(height: 16),
                  _mainFuncUI(),
                  SizedBox(height: DimensManager.dimens.setHeight(16)),
                  _scholarshipUI(),
                  SizedBox(height: DimensManager.dimens.setHeight(16)),
                  _activeUI(),
                  SizedBox(height: DimensManager.dimens.setHeight(32)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _activeUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText(
          'Các bài báo',
          style: TextStyle(
              fontSize: DimensManager.dimens.setSp(16),
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: DimensManager.dimens.setHeight(12)),
        LayoutBuilder(builder: (context, constraints) {
          final itemWidth = (constraints.maxWidth - DimensManager.dimens.setWidth(16)) / 2;
          return Wrap(
            spacing: DimensManager.dimens.setWidth(16),
            runSpacing: DimensManager.dimens.setHeight(16),
            children: const [
              ActiveCard(
                image: AppAssets.donateBlood,
                text: 'Ngày hội hiến máu diễn ra trên địa bàn Thành phố Đà Nẵng',
              ),
              ActiveCard(
                image: AppAssets.healthCare,
                text: 'Ngày hội hiến máu diễn ra tại sảnh A Đại học Sư Phạm Kỹ Thuật',
              )
            ]
                .map((item) => SizedBox(
                      width: itemWidth,
                      child: item,
                    ))
                .toList(),
          );
        })
      ],
    );
  }

  _scholarshipUI() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: DimensManager.dimens.setHeight(131),
      width: DimensManager.dimens.setWidth(358),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: UIText(
              'Học bổng',
              style: TextStyle(
                  fontSize: DimensManager.dimens.setSp(16),
                  color: Colors.black,
                  fontFamily: AppFonts.nunito,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemScholarshipUI(
                onTap: () => Navigator.pushNamed(context, RoutesName.encouragingStudy),
                icon: AppAssets.icScholarShip1,
                text: 'Học tập',
              ),
              ItemScholarshipUI(
                onTap: () => Navigator.pushNamed(context, RoutesName.uteScholarship),
                icon: AppAssets.icScholarShip2,
                text: 'UTE',
              ),
              ItemScholarshipUI(
                onTap: () => Navigator.pushNamed(context, RoutesName.outsideScholarship),
                icon: AppAssets.icScholarShip3,
                text: 'Từ các đơn vị',
              ),
            ],
          )
        ],
      ),
    );
  }

  _mainFuncUI() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      UIText(
        'Điểm Rèn Luyện',
        style: TextStyle(
            fontSize: DimensManager.dimens.setSp(16),
            color: Colors.black,
            fontFamily: AppFonts.nunito,
            fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          CardHome(
            onTap: () => Routes.goToTrainingPointScreen(context, arguments: user?.email ?? ""),
            color: AppColors.blue,
            icon: AppAssets.icTrainingPoint,
            text: 'Tự đánh giá\n điểm rèn luyện',
            height: 200,
          ),
          SizedBox(width: DimensManager.dimens.setSp(18)),
          CardHome(
            onTap: () => Navigator.pushNamed(context, RoutesName.trainingPointHistory),
            color: AppColors.lightBlue,
            icon: AppAssets.icHistoryMini,
            text: 'Xem lịch sử\n điểm rèn luyện',
            height: 200,
          ),
        ],
      )
    ]);
  }

  _slideBanner() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: DimensManager.dimens.setHeight(120),
            width: DimensManager.dimens.setWidth(358),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CarouselSlider(
              items: imageList
                  .map(
                    (item) => Image.asset(
                      item['image_path'],
                      fit: BoxFit.none,
                      width: DimensManager.dimens.setWidth(358),
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio:
                    DimensManager.dimens.setWidth(358) / DimensManager.dimens.setHeight(120),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 16 : 4,
                  height: 4.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? AppColors.sliderIndicatorColor
                          : AppColors.hideIndicatorColor),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
