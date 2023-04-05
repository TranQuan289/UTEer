import 'package:url_launcher/url_launcher_string.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class VerifyMailViewModel extends BaseViewModel {
  void goToLoginScreen() {
    Routes.goToLoginScreen(context);
  }

  Future<void> goToEmail() async {
    const url = 'https://mail.google.com/mail/u/0/#inbox';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    }
  }
}
