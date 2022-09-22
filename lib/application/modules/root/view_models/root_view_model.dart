import 'package:flutter/foundation.dart';
import 'package:polynesia/application/services/index.dart';

class RootViewModel with ChangeNotifier {
  UserService userService = serviceDependency.get<UserService>();
  int previousSelectedIndex = 0;
  int selectedIndex = 0;

  void switchSelectedIndex(int index) {
    previousSelectedIndex = selectedIndex;
    selectedIndex = index;
    notifyListeners();
  }

  void rollbackSelectedIndex() {
    selectedIndex = previousSelectedIndex;
    notifyListeners();
  }
}
