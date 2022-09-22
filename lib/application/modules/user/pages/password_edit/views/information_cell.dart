import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:polynesia/application/common/index.dart';
import 'package:polynesia/application/modules/components/index.dart';

class InformationCell extends BaseWidget {
  const InformationCell({
    Key? key,
    this.label = '',
    this.hintText = '',
    this.onChanged,
    this.onSubmitted,
    required this.controller,
    this.focusNode,
    this.obscureText = false,
    this.keyboardType,
    this.maxLength,
  }) : super(key: key);

  final String label;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  State<BaseWidget> getState() => InformationCellState();
}

class InformationCellState extends BaseWidgetState<InformationCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.focusNode?.requestFocus();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
        color: ColorUtil.fromHex('#3C4861'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                height: 1.4,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: ColorUtil.fromHex('#EAEBEE'),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              focusNode: widget.focusNode,
              controller: widget.controller,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              keyboardType: widget.keyboardType,
              maxLength: widget.maxLength,
              obscureText: widget.obscureText ?? false,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: ColorUtil.fromHex('#EAEBEE'),
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                counterText: '',
                contentPadding: const EdgeInsets.all(0),
                isDense: true,
                labelStyle: TextStyle(
                  height: 1.4,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: ColorUtil.fromHex('#EAEBEE'),
                ),
                hintStyle: TextStyle(
                  height: 1.4,
                  fontSize: 12,
                  color: ColorUtil.fromHex('#848DA4'),
                ),
              ),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
