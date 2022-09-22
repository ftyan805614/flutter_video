import 'package:polynesia/application/common/utils/color_util.dart';
import 'package:polynesia/application/constants/img_prefix.dart';
import 'package:polynesia/application/data/index.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/services/index.dart';
import 'package:provider/provider.dart';
import 'package:polynesia/application/routes/app_routes.dart';

class ProfileWidget extends BaseWidget {
  @override
  State<StatefulWidget> getState() {
    return _ProfileWidgetState();
  }
}

class _ProfileWidgetState extends BaseWidgetState<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (_, userService, child) {
        UserDetailEntity? userInfo = userService.userInfo;
        if (userInfo == null) {
          return Container();
        }
        int nowTimeSeconds = DateTime.now().millisecondsSinceEpoch;
        int createTime = userInfo.createdAt ?? 0;
        int sep = nowTimeSeconds - createTime * 1000;
        num day = sep / (1000 * 24 * 60 * 60);
        String avatar = 'assets/images/profile.png';
        if (userInfo.avatar != null) {
          avatar = "${ImgPrefix.userImagePre1}${userInfo.avatar}";
        }

        return GestureDetector(
          onTap: () {
            onPush(
              AppRoutes.personalData,
            );
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(avatar),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              userInfo.username ?? "",
                              style: TextStyle(
                                  color: ColorUtil.fromHex('F0C59A'),
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Image(
                                image: AssetImage(
                                    'assets/images/VIP${(userInfo.levelId ?? 1) - 1}.png')),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '加入澳门澳博第${day.ceil()}天',
                          style: TextStyle(
                            color: ColorUtil.fromHex('95A4B3'),
                            fontSize: 11,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Image(
                      image: AssetImage(
                        "assets/images/user_arrow.png",
                      ),
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 24),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
