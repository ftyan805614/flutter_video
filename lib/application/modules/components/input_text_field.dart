import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
  }) : super(key: key);

  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction,
      expands: false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.fromLTRB(16, 10, 20, 10),
        hintText: hintText,
        fillColor: fillColor ?? const Color.fromRGBO(0, 0, 0, 0.3),
        filled: true,
        errorStyle: const TextStyle(height: 0, color: Colors.transparent),
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.zero,
            borderSide: BorderSide(color: borderColor ?? const Color(0xFF707070), width: .5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.zero,
            borderSide:  BorderSide(color: borderColor ?? const Color(0xFF707070), width: .5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.zero,
            borderSide: BorderSide(color: borderColor ?? const Color(0xFF707070), width: .5)),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
          borderSide: const BorderSide(color: Colors.red, width: .5),
        ),
      ),
      style: const TextStyle(
        fontSize: 13,
        color: Colors.white,
      ),
    );
  }
}
