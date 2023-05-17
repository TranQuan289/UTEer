import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uteer/utils/routes/routes_name.dart';
import 'package:uteer/view/widgets/appbar.dart';
import 'package:uteer/view/widgets/ui_search_input.dart';

import '../../res/constant/app_assets.dart';
import '../../res/style/app_colors.dart';
import '../../utils/dimens/dimens_manager.dart';
import '../widgets/status_avatar.dart';
import '../widgets/ui_item_chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({this.hasBackButton = false, super.key});
  final bool hasBackButton;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool activeButton = true;

  @override
  Widget build(BuildContext context) {
    List itemChat = [
      UiItemChat(
        activeAvatar: true,
        textName: 'Trần Quân',
        fontWeightName: FontWeight.w700,
        textChat: 'Sao bạn cộng sai điểm rèn luyện cho tôi thế?',
        colorTextChat: AppColors.inFieldTextColor,
        fontWeightChat: FontWeight.w600,
        timeChat: '· 9:40 AM',
        activeRead: ActiveRead.none,
        onTap: () {
          Navigator.pushNamed(context, RoutesName.chatDetail);
        },
        avatar: '',
      ),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(context, 'Đoạn chat', leading: widget.hasBackButton, actions: [
        SvgPicture.asset(AppAssets.icEdit),
        SizedBox(
          width: DimensManager.dimens.setWidth(25),
        )
      ]),
      body: Column(
        children: [
          Container(
              color: Colors.white,
              width: DimensManager.dimens.setWidth(390),
              height: DimensManager.dimens.setHeight(48),
              child: const UISearchInput()),
          SlidableAutoCloseBehavior(
            closeWhenOpened: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemChat.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane:
                      ActionPane(extentRatio: 0.2, motion: const BehindMotion(), children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: DimensManager.dimens.setWidth(12)),
                      child: IconButton(onPressed: () {}, icon: SvgPicture.asset(AppAssets.icBin)),
                    )
                  ]),
                  child: itemChat[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
