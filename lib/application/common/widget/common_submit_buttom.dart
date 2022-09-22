import 'package:flutter/material.dart';
import 'package:polynesia/application/common/utils/color_util.dart';

class CommonSubmitButton extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;
  final double horizontal;
  final double vertical;
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;

  const CommonSubmitButton(this.title,
      {Key? key,
      this.enable = true,
      this.onPressed,
      this.horizontal = 26,
      this.vertical = 15,
      this.verticalPadding = 10.5,
      this.horizontalPadding = 10.5,
      this.fontSize = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2 * vertical + 42,
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorUtil.fromHex('#FFE7CF'),
                ColorUtil.fromHex('#F0C59A'),
              ],
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(
                title,
                style:
                    TextStyle(fontSize: fontSize, color: const Color(0xff79420D)),
              ),
            ),
          )),
    );
  }
}
