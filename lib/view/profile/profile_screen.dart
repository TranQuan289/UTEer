import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uteer/models/user_model.dart';
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
  final String email;
  const ProfileScreen({super.key, required this.email});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UsersModel? user;

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
      final UsersModel user = UsersModel.fromFirestore(documents.first, null);
      setState(() {
        this.user = user;
      });
    } else {
      print('No user found with email: $email');
    }
  }

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
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (!mounted) return;
                  Routes.goToLoginScreen(context);
                }))
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
                  UIText(
                    user?.name ?? "",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  UIText(
                    user?.msv ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white),
                  ),
                  SizedBox(
                    height: DimensManager.dimens.setHeight(12),
                  ),
                  UIText(
                    user?.major ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 12, color: Colors.white),
                  ),
                  UIText(
                    user?.department ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 12, color: Colors.white),
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
                Navigator.pushNamed(context, RoutesName.profileDetail);
              }),
              _profileItem(AppAssets.icQr, 'Mã QR cá nhân', onTap: () {
                Navigator.pushNamed(context, RoutesName.myQr);
              }),
              _profileItem(AppAssets.icPassword, 'Đổi mật khẩu', onTap: () {
                Navigator.pushNamed(context, RoutesName.changePassword);
              }),
              _profileItem(AppAssets.icSupport, 'Liên hệ', onTap: () {
                Navigator.pushNamed(context, RoutesName.contact);
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
