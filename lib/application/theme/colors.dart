import 'package:flutter/material.dart';
import 'package:polynesia/application/common/index.dart';

class TColor {
  /// 页面底部tabBar背景色
  static Color appBarBackground = const Color(0xFF263350);

  ///底部tabBar文字未选中颜色
  static Color bottomTitleColor = const Color(0xFFFFFFFF);

  ///黄金色
  static const Color primaryGold = Color(0xFFF0C59A);

  ///底部tabbar文字选中颜色
  static Color bottomTitleSelectColor = ColorUtil.fromHex("#F0C59A");

  /// 页面顶部导航栏字体颜色(与背景色搭配)
  static const Color appBarTitle = Color(0xFFFFFFFF);

  /// 程序主色调
  static Color primaryColor = const Color(0xFF263350);

  /// 主视图背景色
  static Color primaryBackground = const Color(0xFF263350);
  // * 次级视图背景色
  static Color secondaryBackground = ColorUtil.fromHex("#263350");
  static Color thirdBackground = const Color(0xFF3C4861);

  // * 程序主要的标题颜色
  static const Color primaryTitleColor = Color(0xFFEFC599);
  // * 程序次要的标题颜色
  static const Color secondaryTitleColor = Color(0xFF848DA4);

  // * 程序按钮背景
  static Color buttonPrimaryBackground = ColorUtil.fromHex("#0996FF");
  // * 程序按钮颜色
  static const Color buttonPrimaryTitle = Color(0xFFFFFFFF);

  // * 个人中心背景颜色
  static const Color userBackground = Color(0xFFF1F5FB);

  // * ------------------------------------
  static const Color pageTitle = Color(0xFF666666);

  static const Color appMain = Color(0xFF666666);
  static const Color textDark = Color(0xFF333333);
  static const Color textNormal = Color(0xFF666666);
  static const Color textGray = Color(0xFFABB4BD);

  // * 按钮颜色
  static const Color buttonBackgroundBlue = Color.fromARGB(255, 4, 62, 114);

  // 分割线
  static Color divider = Colors.grey.shade400;
  //color
  static const Color cModeDark = Color(0xFF100000);
  static const Color cModeDarkColorButtom = Color(0xFFEF3652);
  static const Color cModeDarkColorButtonText = Color(0xFFFFFFFF);
  static const Color cModeDarkColorFontTitle = Color(0xFFFFFFFF);
  static const Color cModeDarkColorFontSubTitle = Color(0xFFABB4BD);
  static const Color cModeDarkColorTextBox = Color(0xFF2A2C36);
  static const Color cModeDarkColorTextBoxLabel = Color(0xFFABB4BD);

  static const Color halfTransparent = Color(0x80000000);
}
