import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uteer/view/widgets/status_avatar.dart';

import '../../models/message_model.dart';
import '../../res/constant/app_assets.dart';
import '../../res/style/app_colors.dart';
import '../../utils/dimens/dimens_manager.dart';
import '../widgets/ui_back_button.dart';
import '../widgets/ui_input_chat.dart';
import '../widgets/ui_text.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool showWarning = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.banner),
              fit: BoxFit.cover,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: UIBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        titleSpacing: DimensManager.dimens.setWidth(-17),
        title: Row(
          children: [
            const StatusAvatar(
              sizeMax: false,
              activeStatus: true,
            ),
            SizedBox(width: DimensManager.dimens.setWidth(12)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText(
                  'Bảo Ly',
                  style: TextStyle(
                      fontSize: DimensManager.dimens.setSp(16),
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                UIText(
                  'Đang hoạt động',
                  style: TextStyle(
                      fontSize: DimensManager.dimens.setSp(13),
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
      body: _headerWarning(),
      bottomSheet: const _BottomChatDetail(),
    );
  }

  _headerWarning() {
    return const ListChatDetail();
  }
}

class ListChatDetail extends StatelessWidget {
  const ListChatDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: DimensManager.dimens.setHeight(16)),
        UIText(
          "16:44",
          style: TextStyle(
              fontSize: DimensManager.dimens.setSp(12),
              color: Colors.black.withOpacity(0.3),
              fontWeight: FontWeight.w500),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: messages[index].me
                      ? const EdgeInsets.only(top: 12, bottom: 5)
                      : const EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment:
                        messages[index].me ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      SizedBox(width: DimensManager.dimens.setWidth(24)),
                      messages[index].me
                          ? const SizedBox()
                          : const CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage(AppAssets.avatar),
                            ),
                      SizedBox(width: DimensManager.dimens.setWidth(12)),
                      Container(
                          constraints: BoxConstraints(maxWidth: DimensManager.dimens.setWidth(267)),
                          padding: EdgeInsets.only(
                              left: DimensManager.dimens.setWidth(12),
                              right: DimensManager.dimens.setWidth(12),
                              top: DimensManager.dimens.setHeight(6),
                              bottom: DimensManager.dimens.setHeight(7)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(DimensManager.dimens.setSp(18.0))),
                              color: messages[index].me
                                  ? AppColors.requiredColor
                                  : Colors.black.withOpacity(0.06)),
                          child: Text(
                            messages[index].text,
                            style: TextStyle(
                                fontSize: DimensManager.dimens.setSp(17),
                                color:
                                    messages[index].me ? Colors.white : AppColors.headerTextColor,
                                fontWeight: FontWeight.w400),
                          )),
                      SizedBox(width: DimensManager.dimens.setWidth(16))
                    ],
                  ),
                ),
                index == (messages.length - 1)
                    ? Padding(
                        padding: EdgeInsets.only(
                          right: DimensManager.dimens.setWidth(15),
                        ),
                      )
                    : const SizedBox()
              ],
            );
          },
        ),
      ],
    );
  }
}

class _BottomChatDetail extends StatelessWidget {
  const _BottomChatDetail();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: DimensManager.dimens.setHeight(90),
      width: DimensManager.dimens.setWidth(390),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(AppAssets.icSendImage),
          SvgPicture.asset(AppAssets.icSendFile),
          const UiInputChat(),
          SvgPicture.asset(AppAssets.icSend),
        ],
      ),
    );
  }
}
