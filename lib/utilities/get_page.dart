import 'package:flutter/material.dart';
import 'package:android_app_development/constants.dart';

Widget getPage(
    dynamic image, String title, String subTitle, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      image is String
          ? Image.asset(
              image,
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            )
          : Icon(
              image as IconData,
              color: SECONDARY_TEXT_COLOR,
              size: 150,
            ),
      const SizedBox(height: 40),
      Text(
        title.toUpperCase(),
        style: const TextStyle(
            letterSpacing: 1.5,
            color: SECONDARY_TEXT_COLOR,
            fontSize: 40.0,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          subTitle,
          style: const TextStyle(
            color: SECONDARY_TEXT_COLOR,
            fontSize: 13.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
