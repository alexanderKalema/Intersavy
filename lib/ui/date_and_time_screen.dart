import 'dart:ui';
import 'package:android_app_development/models/generic_circle.dart';
import 'package:android_app_development/services/clock_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:android_app_development/models/my_appbar.dart';
import 'package:android_app_development/constants.dart';

class DateAndTimeScreen extends StatefulWidget {
  const DateAndTimeScreen({Key? key}) : super(key: key);

  @override
  State<DateAndTimeScreen> createState() => _DateAndTimeScreenState();
}

class _DateAndTimeScreenState extends State<DateAndTimeScreen> {
  bool _isAnalog = true;
  final IssueRepaint issueRepaint = IssueRepaint();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => issueRepaint.repaint());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    return Scaffold(
        appBar: MyAppBar(
          title: AppLocalizations.of(context)!.dateAndTimeApp,
        ),
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.todayIs,
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  DateFormat.yMMMMd(window.locale.toString()).format(dateTime),
                  style: const TextStyle(fontSize: 45),
                ),
                GenericCircle(
                    fillColor: BUTTON_PRIMARY,
                    height: _isAnalog ? 300 : 100,
                    width: _isAnalog ? 300 : 250,
                    isCircle: _isAnalog ? true : false,
                    child: CustomPaint(
                        painter: _isAnalog
                            ? AnalogClockPainter()
                            : DigitalClockPainter())),
                const SizedBox(),
                GenericCircle(
                  width: 200,
                  height: 50,
                  isCircle: false,
                  onTap: () {
                    setState(() {
                      _isAnalog = !_isAnalog;
                    });
                  },
                  fillColor: BUTTON_PRIMARY,
                  child: Center(
                    child: Text(
                      _isAnalog
                          ? AppLocalizations.of(context)!.changeToDigital
                          : AppLocalizations.of(context)!.changeToAnalog,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
