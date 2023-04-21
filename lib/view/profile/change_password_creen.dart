import 'package:flutter/material.dart';
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/dimens/dimens_manager.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_outlined_button.dart';
import 'package:uteer/view/widgets/ui_textinput.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Đổi mật khẩu"),
      body: Container(
        color: AppColors.white,
        padding: EdgeInsets.all(DimensManager.dimens.setWidth(24)),
        child: Column(children: [
          const UITextInput(
            title: "Mật khẩu hiện tại",
            hint: "Nhập mật khẩu",
          ),
          SizedBox(
            height: DimensManager.dimens.setHeight(24),
          ),
          const UITextInput(
            title: "Mật khẩu mới",
            hint: "Nhập mật khẩu",
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: DimensManager.dimens.setHeight(24),
          ),
          const UITextInput(
            title: "Xác nhận mật khẩu",
            hint: "Nhập mật khẩu",
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(
            height: DimensManager.dimens.setHeight(24),
          ),
          const UIOutlineButton(
            backgroundColor: AppColors.primaryColor,
            title: 'Thay đổi mật khẩu',
            titleStyle: TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}
