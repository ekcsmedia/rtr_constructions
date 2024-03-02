import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({this.textStyle, this.height, this.width,
    this.hintText, super.key});

  final TextStyle?  textStyle;
  final String? hintText;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: textStyle,
            decoration: InputDecoration(
              hintText: hintText ?? "",
            ),
          ),
        ),
      ),
    );
  }
}
