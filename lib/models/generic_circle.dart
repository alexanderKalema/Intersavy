import 'package:android_app_development/constants.dart';
import 'package:flutter/material.dart';

class GenericCircle extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final bool isCircle;
  final bool? isCalculatorButton;
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
    this.isCalculatorButton,
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
              color:  isCalculatorButton?? false ? Colors.black26  : fillColor ??  BUTTON_PRIMARY,
              width: isCalculatorButton?? false ? 1 : 4,
            ),
            borderRadius: isCircle ? null : BorderRadius.circular(15),
            boxShadow:  [
              BoxShadow(
                color: Colors.black26,
                offset: isCalculatorButton?? false ? Offset(0,0) : Offset(20, 20),
                blurRadius: isCalculatorButton?? false ? 3 :40,
              ),
              BoxShadow(
                color: isCalculatorButton?? false ? fillColor ?? Colors.white54 :Colors.white,
                offset: isCalculatorButton?? false ? Offset(0, 0) :Offset(-1, -1),
                blurRadius: isCalculatorButton?? false ? 2:7,
              )

            ]),
        child: child,
      ),
    );
  }
}
