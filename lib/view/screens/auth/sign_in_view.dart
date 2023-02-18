import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:uteer/view/constant/ui_colors.dart';
import 'package:uteer/view/constant/ui_text_styles.dart';
import 'package:uteer/view/screens/auth/forgot_password_view.dart';
import 'package:uteer/view/widgets/button.dart';
import 'package:uteer/view/widgets/text_form_field.dart';

import '../../assets/asset_images.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignInViewState extends State<SignInView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<Offset> _animation =
      Tween(begin: Offset.zero, end: const Offset(0, 0.1)).animate(_controller);
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 110),
              child: Hero(
                tag: 'University',
                child: SlideTransition(
                  position: _animation,
                  child: Image.asset(
                    AssetImages.iconUniversity,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, bottom: 30),
                child: AnimatedTextKit(
                  pause: const Duration(seconds: 3),
                  totalRepeatCount: 2,
                  animatedTexts: [
                    TypewriterAnimatedText('Đăng Nhập',
                        textStyle: TextStyle(
                          color: UIColors.title,
                          fontFamily: 'Serif',
                          fontSize: 20,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 2),
                    child: Text(
                      'Tài khoản',
                      style: UITextStyles.textBlack,
                    ),
                  ),
                  TextFormFieldWidget(
                      textController: emailController,
                      hintLabel: 'example@sv.ute.udn.vn',
                      iconPassword: false,
                      isEnabled: true),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 2),
                    child: Text(
                      'Mật khẩu',
                      style: UITextStyles.textBlack,
                    ),
                  ),
                  TextFormFieldWidget(
                      textController: passwordController,
                      hintLabel: 'example123@',
                      iconPassword: true,
                      isEnabled: true),
                  const SizedBox(
                    height: 80,
                  ),
                  BasicButton(
                    text: 'Đăng nhập',
                    onPressed: () {},
                  ),
                  Center(
                    child: BackTextButton(
                      text: "Quên mật khẩu?",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPasswordView()),
                        );
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
