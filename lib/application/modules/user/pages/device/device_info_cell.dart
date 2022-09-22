import 'package:flutter/material.dart';
import 'package:polynesia/application/common/utils/color_util.dart';

class DeviceInfoCell extends StatelessWidget {
  const DeviceInfoCell({Key? key, required this.label, required this.value})
      : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.fromHex('#3C4861'),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                height: 1.4,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorUtil.fromHex('#EAEBEE'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                textAlign: TextAlign.right,
                value,
                style: TextStyle(
                  height: 1.4,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: ColorUtil.fromHex('#95A4B3'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
