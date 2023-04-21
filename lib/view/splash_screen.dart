import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uteer/utils/routes/routes_name.dart';

import '../res/constant/app_assets.dart';
import '../res/style/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    countDownTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                AppAssets.iconUniversity,
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
                      AppAssets.iconDepartment,
                      width: 40,
                      height: 40,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.blue.withOpacity(0.7),
                      size: 15,
                    ),
                    Image.asset(
                      AppAssets.iconMe,
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
      Navigator.pushNamed(context, RoutesName.login);
    });
  }
}
