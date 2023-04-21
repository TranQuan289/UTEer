import 'package:flutter/material.dart';
import 'package:uteer/view/widgets/status_avatar.dart';
import 'package:uteer/view/widgets/ui_text.dart';

import '../../res/style/app_colors.dart';
import '../../utils/dimens/dimens_manager.dart';

class UiItemChat extends StatelessWidget {
  const UiItemChat({
    super.key,
    required this.activeAvatar,
    required this.textName,
    required this.fontWeightName,
    required this.textChat,
    required this.fontWeightChat,
    required this.timeChat,
    required this.activeRead,
    required this.colorTextChat,
    required this.onTap,
    required this.avatar,
  });

  final bool activeAvatar;
  final String textName;
  final String avatar;
  final FontWeight fontWeightName;
  final String textChat;
  final Color colorTextChat;
  final FontWeight fontWeightChat;
  final String timeChat;
  final Enum activeRead;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        width: DimensManager.dimens.setWidth(390),
        height: DimensManager.dimens.setHeight(76),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                flex: 3,
                child: StatusAvatar(
                  sizeMax: true,
                  activeStatus: activeAvatar,
                  // avatar: avatar,
                )
                // child: CachedNetworkImage(
                //   imageUrl: "http://103.154.176.108:3005/$avatar",
                //   imageBuilder: (context, imageProvider) => Container(
                //     width: 50.0,
                //     height: 50.0,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       image: DecorationImage(
                //           image: imageProvider, fit: BoxFit.cover),
                //     ),
                //   ),
                // ),
                ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText(
                    textName,
                    style: TextStyle(
                        fontSize: DimensManager.dimens.setSp(16),
                        color: AppColors.headerTextColor,
                        fontWeight: fontWeightName),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: UIText(
                          textChat,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: DimensManager.dimens.setSp(14),
                              color: colorTextChat,
                              fontWeight: fontWeightChat),
                        ),
                      ),
                      UIText(
                        timeChat,
                        style: TextStyle(
                            fontSize: DimensManager.dimens.setSp(14),
                            color: colorTextChat,
                            fontWeight: fontWeightChat),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Align(alignment: Alignment.centerLeft, child: dotStatus(activeRead)))
          ],
        ),
      ),
    );
  }
}
