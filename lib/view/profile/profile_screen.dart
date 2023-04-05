import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/utils/general_utils.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/utils/routes/routes_name.dart';
import 'package:uteer/view/widgets/ui_outlined_button.dart';
import 'package:uteer/view/widgets/ui_text.dart';

const kIconSize = 24.0;
const kBorderRadius = 50.0;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //late ProfileViewModel _viewModel;
  // @override
  // void initState() {
  // _viewModel = ProfileViewModel(
  //     userRepository: locator<UserRepository>(), authRepository: locator<AuthRepository>())
  //   ..onInitView(context);
  // super.initState();
  // }

  void _confirmSignout(BuildContext context) {
    Utils.showPopup(
      context,
      icon: AppAssets.icSignOutRed,
      title: 'Đăng xuất',
      message: 'Bạn có chắc chắn muốn đăng xuất tài khoản?',
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
          title: 'Đăng xuất',
          backgroundColor: AppColors.primaryColor,
          titleStyle: const TextStyle(color: Colors.white),
          onPressed: () => Routes.goToLoginScreen(context),
        ))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(kBorderRadius),
                    bottomRight: Radius.circular(kBorderRadius))),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SafeArea(
                  bottom: false,
                  child: SizedBox(
                    height: DimensManager.dimens.setHeight(20),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(),
                  _circleAvatar(AppAssets.avatar),
                  SizedBox(
                    height: DimensManager.dimens.setHeight(16),
                  ),
                  const UIText(
                    'Trần Anh Quân',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  const Text(
                    '1911505310144',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(
                    height: DimensManager.dimens.setHeight(12),
                  ),
                  const Text(
                    'Ngành Công Nghệ Thông Tin\nKhoa Công Nghệ Số',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(
                    height: DimensManager.dimens.setHeight(12),
                  ),
                ],
              )
            ]),
          ),
          Expanded(
              child: Column(
            children: [
              _profileItem(AppAssets.icUser, 'Thông tin tài khoản', onTap: () {
                //_viewModel.goToProfileDetailScreen();
              }),
              _profileItem(AppAssets.icQr, 'Mã QR cá nhân', onTap: () {
                //_viewModel.goToMyQrScreen();
              }),
              _profileItem(AppAssets.icHistory, 'Lịch sử', onTap: () {
                Navigator.pushNamed(context, RoutesName.history);
              }),
              _profileItem(AppAssets.icPassword, 'Bảo mật', onTap: () {
                Navigator.pushNamed(context, RoutesName.security);
              }),
              _profileItem(AppAssets.icSupport, 'Liên hệ', onTap: () {
                Navigator.pushNamed(context, RoutesName.changePassword);
              }),
              _profileItem(AppAssets.icSignOut, 'Đăng xuất', onTap: () {
                _confirmSignout(context);
              }),
            ],
          ))
        ]),
      ),
    );
  }

  Widget _circleAvatar(String? url) {
    return CircleAvatar(
      radius: DimensManager.dimens.setWidth(kBorderRadius) + 3,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: DimensManager.dimens.setWidth(kBorderRadius),
        backgroundImage: const AssetImage(AppAssets.avatar),
      ),
    );
  }

  Widget _profileItem(String icon, String title, {void Function()? onTap}) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: DimensManager.dimens.setHeight(16),
              horizontal: DimensManager.dimens.setWidth(24)),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: DimensManager.dimens.setWidth(kIconSize),
                height: kIconSize,
              ),
              const SizedBox(
                width: kIconSize,
              ),
              UIText(
                title,
                size: DimensManager.dimens.setSp(15),
                color: AppColors.headerTextColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
