import 'package:android_app_development/constants.dart';
import 'generic_circle.dart';
import 'package:flutter/material.dart';

typedef CallbackButtonTap = void Function({String buttonText});

class Keyboard extends StatelessWidget {
  const Keyboard(
      {super.key,
      required this.onTap,
      required this.keyboardSigns,
      required this.isScientific});

  final CallbackButtonTap onTap;
  final List<String> keyboardSigns;
  final bool isScientific;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: isScientific
            ? MediaQuery.of(context).size.height * 0.53
            : MediaQuery.of(context).size.height * 0.37,
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisCount: isScientific ? 5 : 4,
            crossAxisSpacing: 10,
            childAspectRatio: isScientific ? 1.2 : 1.6,
          ),
          itemCount: keyboardSigns.length,
          itemBuilder: (context, index) => GenericCircle(
            height: 80,
            width: 40,
            isCircle: false,
            isCalculatorButton: true,
            fillColor: (!isScientific)
                ? (index % 4 == 3)
                    ? BUTTON_SECONDARY
                    : (index < 4)
                        ? BUTTON_PRIMARY
                        : CLOCK_OUTER_CIRCLE
                : (index % 5 == 0 || index < 15)
                    ? BUTTON_PRIMARY
                    : (index % 5 == 4)
                        ? BUTTON_SECONDARY
                        : SECONDARY_TEXT_COLOR,
            child: Center(
                child: Text(
              keyboardSigns[index],
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: isScientific ? 18 : 24),
            )),
            onTap: () => onTap(buttonText: keyboardSigns[index]),
          ),
        ));
  }
}
