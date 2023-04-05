import 'package:flutter/material.dart';
import 'package:uteer/utils/routes/routes_name.dart';
import 'package:uteer/view/widgets/ui_textinput.dart';

import '../constant/ui_text_styles.dart';
import '../widgets/button.dart';
import '../widgets/header/auth_header.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

TextEditingController emailController = TextEditingController();

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthHeader(title: 'Quên mật khẩu'),
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
                    height: 80,
                  ),
                  BasicButton(
                    text: 'Gửi thông tin',
                    onPressed: () {},
                  ),
                  Center(
                    child: BackTextButton(
                      text: "Quay lại đăng nhập",
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.login);
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
