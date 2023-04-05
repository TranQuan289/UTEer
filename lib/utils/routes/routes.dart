import 'package:flutter/material.dart';
import 'package:uteer/utils/routes/routes_name.dart';
import 'package:uteer/view/auth/forgot_password_screen.dart';
import 'package:uteer/view/auth/sign_in_screen.dart';
import 'package:uteer/view/home/home_screen.dart';
import 'package:uteer/view/navigator/navigator_screen.dart';
import 'package:uteer/view/profile/profile_screen.dart';
import 'package:uteer/view/splash_screen.dart';

class Routes {
  static Route<dynamic> routeBuilder(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const SignInScreen());
      case RoutesName.forgotPassword:
        return MaterialPageRoute(builder: (BuildContext context) => const ForgotPasswordScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesName.profile:
        return MaterialPageRoute(builder: (BuildContext context) => const ProfileScreen());
      case RoutesName.navigator:
        return MaterialPageRoute(builder: (BuildContext context) => const NavigatorScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }

  static void goToHomeScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(RoutesName.main, (Route<dynamic> route) => false);
  }

  static void goToLoginScreen(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RoutesName.login, (Route<dynamic> route) => false);
  }

  static void goToRegisterScreen(BuildContext context) {
    Navigator.of(context).pushNamed(RoutesName.register);
  }

  static void goToForgotPasswordScreen(BuildContext context) {
    Navigator.of(context).pushNamed(RoutesName.forgotPassword);
  }

  static void goToVerifyOtpScreen(BuildContext context, {Object? arguments}) {
    Navigator.of(context).pushNamed(RoutesName.verifyOTP, arguments: arguments);
  }

  static void goToVerifyMailScreen(BuildContext context) {
    Navigator.of(context).pushNamed(RoutesName.verifyMail);
  }

  static void goToVerifyMailSuccessScreen(BuildContext context) {
    Navigator.of(context).pushNamed(RoutesName.verifyMailSuccess);
  }

  static void goToCreatePasswordScreen(BuildContext context, {Object? arguments}) {
    Navigator.of(context).pushNamed(RoutesName.createPassword, arguments: arguments);
  }

  static void goToProfileDetailScreen(BuildContext context, arguments) {
    Navigator.of(context).pushNamed(RoutesName.profileDetail, arguments: arguments);
  }

  static void goToOtpDeleteAccount(BuildContext context, {Object? arguments}) {
    Navigator.of(context).pushNamed(RoutesName.otpDeleteProfile, arguments: arguments);
  }

  static void goToMyQrScreen(BuildContext context, arguments) {
    Navigator.of(context).pushNamed(RoutesName.myQr, arguments: arguments);
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static void goToScheduleScreen(BuildContext context) {
    Navigator.of(context).pushNamed(RoutesName.scheduleScreen);
  }

  static void goToHistoryScreen(BuildContext context) {
    Navigator.of(context).pushNamed(RoutesName.history);
  }

  static void goToTrainingPointScreen(BuildContext context) {
    Navigator.of(context).pushNamed(RoutesName.trainingPoint);
  }
}
