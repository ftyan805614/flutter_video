import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/common/utils/screen_adapter.dart';
import 'package:polynesia/application/constants/index.dart';
import 'package:polynesia/application/modules/user/pages/personal/viewModels/personal_data_model.dart';

class AvatarsBottomDrawer extends BaseWidget {
  const AvatarsBottomDrawer({Key? key, this.onConfirmed}) : super(key: key);
  final Function(String)? onConfirmed;

  @override
  State<BaseWidget> getState() => AvatarsBottomDrawerState();
}

class AvatarsBottomDrawerState extends BaseWidgetState<AvatarsBottomDrawer> {
  static const int columns = 4;
  static const double mainAxisSpacing = 20;
  static const double crossAxisSpacing = 15.75;

  String avatar = '';

  @override
  void initState() {
    super.initState();

    PersonalDataModel viewModel = context.read<PersonalDataModel>();
    setAvatar(viewModel.avatar);
  }

  void setAvatar(String src) {
    setState(() {
      avatar = src;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);

    double width = ScreenAdaper.getScreenWidth();
    double avatarSize =
        ((width - 20 * 2) - (crossAxisSpacing * (columns - 1))) / columns;
    double height = (avatarSize * 2) + 20 + 20 * 2;

    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  color: ColorUtil.fromHex('#EAEBEE'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          onBack();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 9,
                          ),
                          child: Text(
                            '取消',
                            style: TextStyle(
                              height: 1.4,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: ColorUtil.fromHex('#848DA4'),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '修改头像',
                        style: TextStyle(
                          height: 1.4,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: ColorUtil.fromHex('#1C263D'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.onConfirmed!(avatar);
                          onBack();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 9,
                          ),
                          child: Text(
                            '确定',
                            style: TextStyle(
                              height: 1.4,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: ColorUtil.fromHex('#3C4861'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: SizedBox(
                        height: height,
                        width: width,
                        child: GridView.count(
                          padding: const EdgeInsets.all(20),
                          mainAxisSpacing: mainAxisSpacing,
                          crossAxisSpacing: crossAxisSpacing,
                          crossAxisCount: columns,
                          children: List.generate(
                            12,
                            (index) {
                              String src = "/avatar/${index + 1}.png";

                              return Badge(
                                showBadge: src == avatar,
                                padding: const EdgeInsets.all(3),
                                position: BadgePosition.bottomEnd(
                                  bottom: 0,
                                  end: 0,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    ColorUtil.fromHex('#FFE7CF'),
                                    ColorUtil.fromHex('#F0C59A'),
                                  ],
                                ),
                                elevation: 0,
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                                // ignore: prefer_const_constructors
                                badgeContent: Icon(
                                  size: 11,
                                  color: Colors.white,
                                  Icons.check_sharp,
                                ),
                                child: renderAvatar(avatarSize, src),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget renderAvatar(
    double avatarSize,
    String src,
  ) {
    return GestureDetector(
      onTap: () {
        setAvatar(src);
      },
      child: Center(
        child: CircleAvatar(
          radius: avatarSize,
          backgroundImage: AssetImage("$avatarDir$src"),
        ),
      ),
    );
  }
}
