import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:android_app_development/constants.dart';

class AnalogClockPainter extends CustomPainter {
  AnalogClockPainter() : super(repaint: IssueRepaint());

  @override
  void paint(Canvas canvas, Size size) {
    DateTime dateTime = DateTime.now();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = math.min(centerX, centerY);

    final outerCirclePaint = Paint()
      ..color = CLOCK_OUTER_CIRCLE
      ..strokeWidth = radius / 20
      ..style = PaintingStyle.stroke;

    final innerCirclePaint = Paint()
      ..color = CLOCK_INNER_CIRCLE
      ..style = PaintingStyle.fill;

    final hourHandPaint = Paint()
      ..color = CLOCK_HOUR_HAND
      ..strokeWidth = radius / 20
      ..strokeCap = StrokeCap.round;

    final minuteHandPaint = Paint()
      ..color =CLOCK_MINUTE_HAND
      ..strokeWidth = radius / 60
      ..strokeCap = StrokeCap.round;

    final secondHandPaint = Paint()
      ..color = CLOCK_SECOND_HAND
      ..strokeWidth = radius / 100
      ..strokeCap = StrokeCap.round;

    final hourLabelPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    // Draw the outer circle
    canvas.drawCircle(
        Offset(centerX, centerY), radius - radius / 20, outerCirclePaint);

    // Draw the inner circle
    canvas.drawCircle(Offset(centerX, centerY), radius / 10, innerCirclePaint);

    // Draw the hour labels
    for (var i = 1; i <= 12; i++) {
      final labelRadians = i * math.pi / 6;
      final labelX = centerX + radius * 0.8 * math.sin(labelRadians);
      final labelY = centerY - radius * 0.8 * math.cos(labelRadians);

      hourLabelPainter.text = TextSpan(
        text: i.toString(),
        style: TextStyle(
          fontFamily: 'PoppinsRegular',
          color: SECONDARY_TEXT_COLOR,
            fontSize: radius / 7,
            fontWeight: FontWeight.bold,
            ),
      );
      hourLabelPainter.layout();
      final labelOffset = Offset(labelX - hourLabelPainter.width / 2,
          labelY - hourLabelPainter.height / 2);
      hourLabelPainter.paint(canvas, labelOffset);
    }

    // Draw the hour hand
    final hourRadians =
        (dateTime.hour % 12 + dateTime.minute / 60) * math.pi / 6;
    final hourHandX = centerX + radius * 0.4 * math.sin(hourRadians);
    final hourHandY = centerY - radius * 0.4 * math.cos(hourRadians);
    canvas.drawLine(
        Offset(centerX, centerY), Offset(hourHandX, hourHandY), hourHandPaint);

    // Draw the minute hand
    final minuteRadians = dateTime.minute * math.pi / 30;
    final minuteHandX = centerX + radius * 0.6 * math.sin(minuteRadians);
    final minuteHandY = centerY - radius * 0.6 * math.cos(minuteRadians);
    canvas.drawLine(Offset(centerX, centerY), Offset(minuteHandX, minuteHandY),
        minuteHandPaint);

    // Draw the second hand
    final secondRadians = dateTime.second * math.pi / 30;
    final secondHandX = centerX + radius * 0.6 * math.sin(secondRadians);
    final secondHandY = centerY - radius * 0.6 * math.cos(secondRadians);
    canvas.drawLine(Offset(centerX, centerY), Offset(secondHandX, secondHandY),
        secondHandPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IssueRepaint extends ValueNotifier<String> {
  Timer? timer;

  // IssueRepaint(): super([]);
  IssueRepaint._sharedInstance() : super('');
  static final IssueRepaint _shared = IssueRepaint._sharedInstance();

  factory IssueRepaint() => _shared;

  void repaint() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      value = '';
      notifyListeners();
    });
  }
}

class DigitalClockPainter extends CustomPainter {
  DigitalClockPainter() : super(repaint: IssueRepaint());

  @override
  void paint(Canvas canvas, Size size) {
    DateTime dateTime = DateTime.now();
    // Background
    Paint background = Paint()
      ..color =  BUTTON_PRIMARY
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), background);

    // Text style
    TextStyle textStyle = TextStyle(
      fontFamily: 'PoppinsRegular',
      color: SECONDARY_TEXT_COLOR,
      fontWeight: FontWeight.bold,
      fontSize: size.height / 2,
    );

    // Digital time display
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: '${dateTime.hour.toString().padLeft(2, '0')}:'
            '${dateTime.minute.toString().padLeft(2, '0')}:'
            '${dateTime.second.toString().padLeft(2, '0')}',
        style: textStyle,
      ),
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(DigitalClockPainter oldDelegate) {
    return true;
  }
}
