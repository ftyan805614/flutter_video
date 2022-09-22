import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimens.dart';

class TextStyles {
  static TextStyle homeCardTextPrime = const TextStyle(fontSize: Dimens.fontSp16, color: Colors.white, fontWeight: FontWeight.normal);

  static TextStyle homeCardTextSecondary = const TextStyle(fontSize: Dimens.fontSp16, color: Colors.white, fontWeight: FontWeight.normal);

  static TextStyle homeCardTextTiny = const TextStyle(fontSize: Dimens.fontSp12, color: Colors.white, fontWeight: FontWeight.normal);

  // top page title
  static TextStyle pageTitle = const TextStyle(fontSize: Dimens.fontSp24, color: Colors.black, fontWeight: FontWeight.bold);

  static TextStyle discoveryListTitle = const TextStyle(fontSize: Dimens.fontSp16, color: TColor.textNormal, fontWeight: FontWeight.bold);

  static TextStyle listTitle = const TextStyle(
    fontSize: Dimens.fontSp16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle whiteBoldText = const TextStyle(
    fontSize: Dimens.fontSp14,
    color: TColor.textNormal,
    fontWeight: FontWeight.bold,
  );

  static TextStyle listContent = const TextStyle(fontSize: Dimens.fontSp14, color: TColor.textNormal, fontWeight: FontWeight.bold);

  static TextStyle listExtra = const TextStyle(fontSize: Dimens.fontSp12, color: TColor.textGray, fontWeight: FontWeight.bold);
}
