import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/constants/img_prefix.dart';
import 'package:polynesia/application/modules/components/index.dart';

class ContactUsWidget extends BaseWidget {
  const ContactUsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> getState() {
    return _ContactUsWidgetState();
  }
}

class _ContactUsWidgetState extends BaseWidgetState<ContactUsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffE5E5E5),
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: ColorUtil.fromHex('#FFFFFF'),
              child: Column(
                children: [
                  const SizedBox(
                    width: 9,
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Image(
                          image: AssetImage(
                              "${ImgPrefix.userImagePre}ic_contact_identity_line.png"),
                          width: 3,
                          height: 17,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "反馈或建议",
                          style: TextStyle(
                              fontSize: 16, color: ColorUtil.fromHex("#3C4861")),
                        ),
                      ],
                    ),
                  ),
                  _item("投诉建议", "tamwns@tgjt888.com",
                      "${ImgPrefix.userImagePre}ic_contact_us_suggest.png"),
                  Container(
                    width: double.infinity,
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    color: const Color(0xffF0F2F7),
                  ),
                  _item("客服邮箱", "tamwns@tgjt888.com",
                      "${ImgPrefix.userImagePre}ic_contact_us_suggest.png")
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              color: ColorUtil.fromHex('#FFFFFF'),
              child: Column(
                children: [
                  const SizedBox(
                    width: 9,
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Image(
                          image: AssetImage(
                              "${ImgPrefix.userImagePre}ic_contact_identity_line.png"),
                          width: 3,
                          height: 17,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "成为合营伙伴",
                          style: TextStyle(
                              fontSize: 16, color: ColorUtil.fromHex("#3C4861")),
                        ),
                      ],
                    ),
                  ),
                  _item("合营部Whats Tap", "即将提供",
                      "${ImgPrefix.userImagePre}ic_contact_whatstap.png",disable: true),
                ],
              ),
            ),
          ],
        ));
  }

  _item(String title, String secondTitle, String imgPath,{bool disable=false}) {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          const SizedBox(
            width: 28,
          ),
          Image.asset(
            imgPath,
            width: 36,
            height: 36,
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            width: 1,
            height: 40,
            color: const Color(0xffF0F2F7),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xff2E3955)),
                ),
                Text(
                  secondTitle,
                  style:
                  TextStyle(fontSize: 14, color: disable?const Color(0xffBFBFBF):const Color(0xff2E3955)),
                )
              ],
            ),
          ),
          SizedBox(
            width: 74,
            height: 34,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: disable?const Color(0xffA2A2A2):const Color(0xff6AAAF5), width: 1),
              ),
              child:  InkWell(
                onTap: (){
                  Clipboard.setData(ClipboardData(text:secondTitle));
                  onShowToast("复制成功");
                },
                child: Center(
                    child: Text(
                  "复制",
                  style: TextStyle(fontSize: 14, color: disable?const Color(0xffBFBFBF):const Color(0xff6AAAF5) ),
                )),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
