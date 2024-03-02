import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {this.height = 40,
      this.width = 20,
      this.color,
      this.data,
      this.icon,
      this.textStyle,
      this.onTap,
      this.isLogo = false,
      super.key});

  final double width;
  final double height;
  final Color? color;
  final String? data;
  final IconData? icon;
  final bool isLogo;
  final TextStyle? textStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        color: color ?? Colors.blue,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data ?? "",
                  style: textStyle,
                ),
              ),
              isLogo
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(icon),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
