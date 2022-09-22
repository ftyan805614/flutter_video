class RegexpHelper {
  static bool isPhone(String input) {
    RegExp mobile = RegExp(r"1[0-9]\d{9}$");
    return mobile.hasMatch(input);
  }

  static bool isUsername(String input) {
    RegExp mobile = RegExp(r"^[A-Za-z0-9_-]{6,12}$");
    return mobile.hasMatch(input);
  }

  static bool isPassword(String input) {
    RegExp mobile = RegExp(r"^[A-Za-z0-9_-]{8,20}$");
    return mobile.hasMatch(input);
  }
}
