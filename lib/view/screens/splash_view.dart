// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uteer/view/assets/asset_images.dart';
import 'package:uteer/view/constant/ui_colors.dart';

import 'auth/sign_in_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    countDownTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 3,
            child: Hero(
              tag: 'University',
              child: Image.asset(
                width: 145,
                AssetImages.iconUniversity,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    Image.asset(
                      AssetImages.iconDepartment,
                      width: 40,
                      height: 40,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.blue.withOpacity(0.7),
                      size: 15,
                    ),
                    Image.asset(
                      AssetImages.iconMe,
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  countDownTime() async {
    return Timer(const Duration(seconds: 1), () async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const SignInView()),
          (route) => false);
    });
  }
}
