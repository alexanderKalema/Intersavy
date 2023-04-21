import 'package:android_app_development/models/generic_circle.dart';
import 'package:android_app_development/services/clock_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        appBar: const MyAppBar(
          title: "Date and Time App",
        ),
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Today is",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                    DateFormat.yMMMMd('en_US').format(dateTime),
                  style: TextStyle(fontSize: 45),),
                GenericCircle(
                  fillColor:  BUTTON_PRIMARY,
                    height: _isAnalog ? 300 : 100,
                    width: _isAnalog ? 300 : 250,
                    isCircle: _isAnalog ? true : false,
                    child: CustomPaint(
                        painter: _isAnalog
                            ? AnalogClockPainter()
                            : DigitalClockPainter())),
                const SizedBox(),
                GenericCircle(
                  width: 150,
                  height: 50,
                  isCircle: false,
                  onTap: () {
                    setState(() {
                      _isAnalog = !_isAnalog;
                    });
                  },
                  fillColor:  BUTTON_PRIMARY,
                  child: Center(
                    child: Text(
                      _isAnalog ? "Change to digital" : "Change to analog",
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
