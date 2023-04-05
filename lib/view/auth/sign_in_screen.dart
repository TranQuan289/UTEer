import 'package:flutter/material.dart';
import 'package:uteer/utils/routes/routes_name.dart';
import 'package:uteer/view/constant/ui_text_styles.dart';
import 'package:uteer/view/widgets/button.dart';
import 'package:uteer/view/widgets/ui_textinput.dart';

import '../widgets/header/auth_header.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthHeader(
              title: 'Đăng Nhập',
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 2),
                    child: Text(
                      'Tài khoản',
                      style: UITextStyles.textBlack,
                    ),
                  ),
                  UITextInput(
                    controller: emailController,
                    hint: 'example@sv.ute.udn.vn',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 2),
                    child: Text(
                      'Mật khẩu',
                      style: UITextStyles.textBlack,
                    ),
                  ),
                  UITextInput(
                    controller: passwordController,
                    hint: 'example123@',
                    isObscure: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  BasicButton(
                    text: 'Đăng nhập',
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.navigator);
                    },
                  ),
                  Center(
                    child: BackTextButton(
                      text: "Quên mật khẩu?",
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.forgotPassword);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
