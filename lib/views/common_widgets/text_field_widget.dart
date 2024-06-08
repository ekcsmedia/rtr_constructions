import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({this.textStyle, this.height, this.width,
    this.hintText, this.controller, this.inputFormatters, super.key});

  final TextStyle?  textStyle;
  final String? hintText;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Center(
        child: TextField(
          style: textStyle,
          controller: controller,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText ?? "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
