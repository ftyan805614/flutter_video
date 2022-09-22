import 'package:logger/logger.dart';

class Log {
  static const bool _debug = true;
  static final logger = Logger(
      printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 50,
    colors: true,
    printEmojis: true,
    printTime: false,
  ));

  static void d(dynamic obj) {
    if (_debug) {
      logger.d(obj);
    }
  }

  static void e(dynamic obj) {
    if (_debug) {
      logger.e(obj);
    }
  }
}
