import 'package:flutter_svg/flutter_svg.dart';
import 'package:uteer/res/constant/app_assets.dart';

class Message {
  final SvgPicture avatar;

  final bool isRead;
  final String text;
  final bool me;

  Message({
    required this.me,
    required this.avatar,
    required this.text,
    required this.isRead,
  });
}

final List<Message> messages = [
  Message(
    me: false,
    avatar: SvgPicture.asset(AppAssets.avatar),
    text: "Hôm nay bạn thế nào?",
    isRead: true,
  ),
  Message(
    me: true,
    avatar: SvgPicture.asset(AppAssets.avatar),
    text: "Tôi khoẻ, còn bạn thì sao?",
    isRead: true,
  ),
  Message(
    me: false,
    avatar: SvgPicture.asset(AppAssets.avatar),
    text: "Tôi khoẻ, tôi muốn đi hiến máu",
    isRead: true,
  ),
  Message(
    me: true,
    avatar: SvgPicture.asset(AppAssets.avatar),
    text: "Ok thoai",
    isRead: true,
  ),
];
