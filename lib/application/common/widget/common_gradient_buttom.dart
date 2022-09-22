import 'package:flutter/material.dart';
import 'package:polynesia/application/common/utils/color_util.dart';

class CommomGradientButton extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;
  final double fontSize;
  final Color titleColor;
  final Color gradientStart;
  final Color gradientEnd;
  final double borderCircle;

  const CommomGradientButton(this.title,
      {Key? key,
      this.enable = true,
      this.onPressed,
      this.fontSize = 15,
      this.titleColor = const Color(0xff79420D),
      this.gradientStart = const Color(0xffFFE7CF),
      this.gradientEnd = const Color(0xffF0C59A),
      this.borderCircle = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gradientStart,
              gradientEnd,
            ],
          ),
          borderRadius: BorderRadius.circular(borderCircle),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: fontSize, color: titleColor),
            ),
          ),
        ));
  }
}
