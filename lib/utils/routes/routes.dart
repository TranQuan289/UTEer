import 'package:flutter/material.dart';
import 'package:uteer/utils/routes/routes_name.dart';
import 'package:uteer/view/auth/forgot_password_screen.dart';
import 'package:uteer/view/auth/sign_in_screen.dart';
import 'package:uteer/view/chat/chat_detail_screen.dart';
import 'package:uteer/view/chat/chat_screen.dart';
import 'package:uteer/view/home/home_screen.dart';
import 'package:uteer/view/navigator/navigator_screen.dart';
import 'package:uteer/view/profile/change_password_creen.dart';
import 'package:uteer/view/profile/contact_screen.dart';
import 'package:uteer/view/profile/my_qr_screen.dart';
import 'package:uteer/view/profile/profile_detail_screen.dart';
import 'package:uteer/view/profile/profile_screen.dart';
import 'package:uteer/view/qr/qr_scanner_screen.dart';
import 'package:uteer/view/scholarship/UTE_scholarship_screen.dart';
import 'package:uteer/view/scholarship/encouraging_study_screen.dart';
import 'package:uteer/view/scholarship/outside_scholarship_screen.dart';
import 'package:uteer/view/splash_screen.dart';
import 'package:uteer/view/training_points/training_points_history_screen.dart';
import 'package:uteer/view/training_points/training_points_screen.dart';

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
        final args = settings.arguments as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(
                  email: args,
                ));
      case RoutesName.profile:
        final args = settings.arguments as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => ProfileScreen(
                  email: args,
                ));
      case RoutesName.navigator:
        final args = settings.arguments as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => NavigatorScreen(
                  email: args,
                ));
      case RoutesName.profileDetail:
        return MaterialPageRoute(builder: (BuildContext context) => const ProfileDetailScreen());
      case RoutesName.myQr:
        return MaterialPageRoute(builder: (BuildContext context) => const MyQrScreen());
      case RoutesName.changePassword:
        return MaterialPageRoute(builder: (BuildContext context) => const ChangePasswordScreen());
      case RoutesName.contact:
        return MaterialPageRoute(builder: (BuildContext context) => const ContactScreen());
      case RoutesName.chatDetail:
        return MaterialPageRoute(builder: (BuildContext context) => const ChatDetailScreen());
      case RoutesName.chat:
        return MaterialPageRoute(builder: (BuildContext context) => const ChatScreen());
      case RoutesName.trainingPoint:
        final args = settings.arguments as String;
        return MaterialPageRoute(
            builder: (BuildContext context) => TrainingPointsScreen(
                  email: args,
                ));
      case RoutesName.trainingPointHistory:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TrainingPointsHistoryScreen());
      case RoutesName.encouragingStudy:
        return MaterialPageRoute(builder: (BuildContext context) => const EncouragingStudyScreen());
      case RoutesName.uteScholarship:
        return MaterialPageRoute(builder: (BuildContext context) => const UteScholarshipScreen());
      case RoutesName.outsideScholarship:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OutsideScholarshipScreen());
      case RoutesName.qrScanner:
        return MaterialPageRoute(builder: (BuildContext context) => const QRScannerScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }

  static void goToHomeScreen(BuildContext context, {Object? arguments}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        RoutesName.main, arguments: arguments, (Route<dynamic> route) => false);
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

  static void goToTrainingPointScreen(BuildContext context, {String? arguments}) {
    Navigator.of(context).pushNamed(RoutesName.trainingPoint, arguments: arguments);
  }

  static void goToNavigatorScreen(BuildContext context, {String? arguments}) {
    Navigator.of(context).pushNamed(RoutesName.navigator, arguments: arguments);
  }
}
