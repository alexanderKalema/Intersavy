import 'package:android_app_development/constants.dart';
import 'package:flutter/material.dart';


typedef DialogOptionBuilder<T> = Map<String, VoidCallback> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  IconData? icon,
  required DialogOptionBuilder optionsBuilder,
}) {
  final options = optionsBuilder();

  return showDialog<T>(
    barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          backgroundColor: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),

          //this right here
          child: SizedBox(
            height: MediaQuery.of(context).size.height* 0.40,
            width: double.maxFinite,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Icon(
                      icon,
                      size: 60,
                      color: BUTTON_SECONDARY,
                    ),
                  ),
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),

                  Text(
                    content,
                    style: const TextStyle(
                        color: Color(0xFFa0acb8),
                        fontSize: 14,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ...(options.keys).map((optionTitle) {
                        final value = options[optionTitle];
                        return SizedBox(
                          height:MediaQuery.of(context).size.height* 0.06,
                          child: TextButton(
                              style: ButtonStyle(
                                  textStyle:
                                  MaterialStateProperty.resolveWith(
                                          (states) {
                                        return const TextStyle(
                                            color: Color(0xFFa0acb8),
                                            fontSize: 19,
                                        );
                                      }),
                                  overlayColor:
                                  MaterialStateProperty.all<Color>(
                                      BUTTON_SECONDARY
                                  ),
                                  foregroundColor:
                                  MaterialStateProperty.resolveWith(
                                          (states) =>  Colors.white
                                  ),
                                  backgroundColor:
                                  MaterialStateColor.resolveWith(
                                          (states) {
                                        return BUTTON_SECONDARY;
                                      }),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18.0),
                                        //side: BorderSide(color: Colors.red)
                                      ))),
                              onPressed: value,
                              child: Text(optionTitle)),
                        );
                      })
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
