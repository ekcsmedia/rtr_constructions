import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({this.width, required this.name, this.height, super.key});
  final double? width;
  final double? height;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      name,
      width: width ?? 400,
      height: height ?? 200,
    );
  }
}
