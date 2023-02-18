import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:uteer/view/screens/auth/sign_in_view.dart';

import '../../assets/asset_images.dart';
import '../../constant/ui_colors.dart';
import '../../constant/ui_text_styles.dart';
import '../../widgets/button.dart';
import '../../widgets/text_form_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

TextEditingController emailController = TextEditingController();

class _ForgotPasswordViewState extends State<ForgotPasswordView>
    with SingleTickerProviderStateMixin {
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
                    TypewriterAnimatedText('Quên mật khẩu',
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
                      'Email',
                      style: UITextStyles.textBlack,
                    ),
                  ),
                  TextFormFieldWidget(
                      textController: emailController,
                      hintLabel: 'Tài khoản',
                      iconPassword: false,
                      isEnabled: true),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInView()),
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
