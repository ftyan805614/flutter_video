import 'dart:io';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:polynesia/application/services/index.dart';
import 'package:polynesia/application/common/utils/device_info_helper.dart';
import 'package:polynesia/application/modules/components/index.dart';
import 'package:polynesia/application/modules/user/pages/device/device_info_cell.dart';

class DeviceInfoPage extends BaseWidget {
  const DeviceInfoPage({Key? key}) : super(key: key);

  @override
  State<BaseWidget> getState() => DeviceInfoPageState();
}

class DeviceInfoPageState extends BaseWidgetState<DeviceInfoPage> {
  static String unknown = 'Unknown';

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  String formattedDate =
      DateFormat('yyyy年MM月dd日 kk:mm:ss').format(DateTime.now());

  Map<String, dynamic> deviceInfo = <String, dynamic>{};
  PackageInfo packageInfo =
      PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');

  String get systemVersion {
    if (Platform.isAndroid) {
      return deviceInfo['version.release'] ?? unknown;
    } else if (Platform.isIOS) {
      return deviceInfo['systemVersion'] ?? unknown;
    } else {
      return unknown;
    }
  }

  String get serialNumber {
    if (Platform.isAndroid) {
      return deviceInfo['id'] ?? unknown;
    } else if (Platform.isIOS) {
      return deviceInfo['identifierForVendor'] ?? unknown;
    } else {
      return unknown;
    }
  }

  String get deviceModel {
    if (Platform.isAndroid) {
      return deviceInfo['model'] ?? unknown;
    } else if (Platform.isIOS) {
      return deviceInfo['model'] ?? unknown;
    } else {
      return unknown;
    }
  }

  Future<void> getPlatformInfo() async {
    Map<String, dynamic> info = await DeviceInfoHelper.getPlatformInfo();

    if (!mounted) return;

    setState(() {
      deviceInfo = info;
    });
  }

  Future<void> getPackageInfo() async {
    PackageInfo info = await PackageInfo.fromPlatform();

    if (!mounted) return;

    setState(() {
      packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();

    getPlatformInfo();
    getPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设备信息'),
        backgroundColor: TColor.appBarBackground,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
      ),
      body: ListView(
        children: [
          Selector<UserService, String>(
            selector: (_, userService) => userService.userInfo?.username ?? '',
            builder: (context, username, child) {
              return DeviceInfoCell(
                label: '会员账号',
                value: username,
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
          DeviceInfoCell(
            label: '设备型号',
            value: deviceModel,
            // value: 'SM-N976N',
          ),
          const SizedBox(
            height: 5,
          ),
          DeviceInfoCell(
            label: '登录IP',
            value: unknown,
            // value: '183.76.153.56',
          ),
          const SizedBox(
            height: 5,
          ),
          DeviceInfoCell(
            label: '系统版本',
            value: systemVersion,
          ),
          const SizedBox(
            height: 5,
          ),
          DeviceInfoCell(
            label: '当前版本',
            value: packageInfo.version,
          ),
          const SizedBox(
            height: 5,
          ),
          DeviceInfoCell(label: '最新版本', value: unknown),
          const SizedBox(
            height: 5,
          ),
          DeviceInfoCell(
            label: '当前时间',
            value: formattedDate,
            // value: '2022年08月15日 13:52:26',
          ),
          const SizedBox(
            height: 5,
          ),
          DeviceInfoCell(
            label: '设备标识',
            value: serialNumber,
          ),
        ],
      ),
    );
  }
}
