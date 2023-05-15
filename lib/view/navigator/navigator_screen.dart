import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/utils/routes/routes_name.dart';
import 'package:uteer/view/chat/chat_screen.dart';
import 'package:uteer/view/home/home_screen.dart';
import 'package:uteer/view/notification/notification_screen.dart';
import 'package:uteer/view/widgets/ui_text.dart';
import 'package:uteer/viewmodels/main_screen_view_model.dart';

import '../profile/profile_screen.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  NavigatorScreenState createState() => NavigatorScreenState();
}

class NavigatorScreenState extends State<NavigatorScreen> {
  Color kEnableColorButton = AppColors.requiredColor;
  Color kDisenableColorButton = Colors.white;
  Color kEnableColorIcon = AppColors.requiredColor;
  Color kDisenableColorIcon = AppColors.disableItemColor;
  Color kEnableColorText = AppColors.requiredColor;
  Color kDisenableColorText = AppColors.disableItemColor;

  int currentTab = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  late MainScreenViewModel _viewModel;
  @override
  void initState() {
    _viewModel = MainScreenViewModel()..onInitView(context);
    _viewModel.changeCurrentTab = changeCurrentTab;
    super.initState();
  }

  void changeCurrentTab(int value) {
    setState(() {
      currentTab = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _viewModel,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            resizeToAvoidBottomInset: false,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.requiredColor,
              child: SvgPicture.asset(
                AppAssets.icQrMini,
                height: 32,
                width: 32,
              ),
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.qrScanner);
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            body: PageStorage(
              bucket: bucket,
              child: screens[currentTab],
            ),
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: SizedBox(
                height: DimensManager.dimens.setHeight(70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 45,
                          onPressed: () {
                            setState(() {
                              currentTab = 0;
                            });
                          },
                          child: ButtonItemNavigator(
                            currentTab: currentTab,
                            tab: 0,
                            icon: AppAssets.icHome,
                            textButton: 'Trang chủ',
                            enableColorButton: kEnableColorButton,
                            disenableColorButton: kDisenableColorButton,
                            enableColorIcon: kEnableColorIcon,
                            disenableColorIcon: kDisenableColorIcon,
                            enableColorText: kEnableColorText,
                            disenableColorText: kDisenableColorText,
                          ),
                        ),
                        MaterialButton(
                          minWidth: 45,
                          onPressed: () {
                            setState(() {
                              currentTab = 1;
                            });
                          },
                          child: ButtonItemNavigator(
                            currentTab: currentTab,
                            tab: 1,
                            icon: AppAssets.icMessage,
                            textButton: 'Tin nhắn',
                            enableColorButton: kEnableColorButton,
                            disenableColorButton: kDisenableColorButton,
                            enableColorIcon: kEnableColorIcon,
                            disenableColorIcon: kDisenableColorIcon,
                            enableColorText: kEnableColorText,
                            disenableColorText: kDisenableColorText,
                          ),
                        ),
                        //Right
                      ],
                    ),
                    //right
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 45,
                          onPressed: () {
                            setState(() {
                              currentTab = 2;
                            });
                          },
                          child: ButtonItemNavigator(
                            currentTab: currentTab,
                            tab: 2,
                            icon: AppAssets.icNotification,
                            textButton: 'Thông báo',
                            enableColorButton: kEnableColorButton,
                            disenableColorButton: kDisenableColorButton,
                            enableColorIcon: kEnableColorIcon,
                            disenableColorIcon: kDisenableColorIcon,
                            enableColorText: kEnableColorText,
                            disenableColorText: kDisenableColorText,
                          ),
                        ),
                        MaterialButton(
                          minWidth: 45,
                          onPressed: () {
                            setState(() {
                              currentTab = 3;
                            });
                          },
                          child: ButtonItemNavigator(
                            currentTab: currentTab,
                            tab: 3,
                            icon: AppAssets.icProfile,
                            textButton: 'Tài khoản',
                            enableColorButton: kEnableColorButton,
                            disenableColorButton: kDisenableColorButton,
                            enableColorIcon: kEnableColorIcon,
                            disenableColorIcon: kDisenableColorIcon,
                            enableColorText: kEnableColorText,
                            disenableColorText: kDisenableColorText,
                          ),
                        ),
                        //Right
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class ButtonItemNavigator extends StatelessWidget {
  const ButtonItemNavigator({
    super.key,
    required this.currentTab,
    required this.tab,
    required this.icon,
    required this.textButton,
    required this.enableColorButton,
    required this.disenableColorButton,
    required this.enableColorIcon,
    required this.disenableColorIcon,
    required this.enableColorText,
    required this.disenableColorText,
  });

  final int currentTab;
  final int tab;
  final String icon;
  final String textButton;
  final Color enableColorButton;
  final Color disenableColorButton;
  final Color enableColorIcon;
  final Color disenableColorIcon;
  final Color enableColorText;
  final Color disenableColorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: DimensManager.dimens.setHeight(4),
          width: DimensManager.dimens.setWidth(45),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: currentTab == tab ? enableColorButton : disenableColorButton,
          ),
        ),
        SvgPicture.asset(
          icon,
          color: currentTab == tab ? enableColorIcon : disenableColorIcon,
        ),
        UIText(textButton,
            style: TextStyle(
                fontSize: DimensManager.dimens.setSp(10),
                color: currentTab == tab ? enableColorText : disenableColorText,
                fontWeight: FontWeight.w700)),
        SizedBox(
          height: DimensManager.dimens.setHeight(10),
        )
      ],
    );
  }
}
