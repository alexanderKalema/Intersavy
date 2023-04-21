import 'package:android_app_development/constants.dart';
import 'package:flutter/material.dart';

class GenericCircle extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final bool isCircle;
  final void Function()? onTap;
  final Color? fillColor;

  const GenericCircle({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
    required this.isCircle,
    this.fillColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
     //   alignment: Alignment.center,
        decoration: BoxDecoration(
            color: fillColor ?? Colors.white,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            border: Border.all(
              color: fillColor ??  BUTTON_PRIMARY,
              width: 4,
            ),
            borderRadius: isCircle ? null : BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(20, 20),
                blurRadius: 40,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-1, -1),
                blurRadius: 7,
              )
            ]),
        child: child,
      ),
    );
  }
}
