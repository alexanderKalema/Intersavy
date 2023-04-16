import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class DateAndTimeProvider extends ChangeNotifier {
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  final List<SavedLaps> savedLaps = [];

  bool get isRunning => _stopwatch.isRunning;

  String get formattedTime {
    var milli = _stopwatch.elapsed.inMilliseconds;
    return _millisecondConverter(milli);
  }

  String sinceLastLapCalculator(String previousLap, String currentLap) {
    int i = 0, j = 0;
    previousLap.split(":").asMap().forEach((index, value) {
      if (index != 3) {
        i += int.parse(value) * (60 * 60 * 1000) ~/ (pow(60, (index)));
      } else {
        i += int.parse(value);
      }
    });
    currentLap.split(":").asMap().forEach((index, value) {
      if (index != 3) {
        j += (int.parse(value) * (60 * 60 * 1000)) ~/ (pow(60, (index)));
      } else {
        j += int.parse(value);
      }
    });

    return _millisecondConverter(j - i);
  }

  String _millisecondConverter(int millisecond) {
    String milliseconds = (millisecond % 1000).toString().padLeft(3, "0");
    String seconds = ((millisecond ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((millisecond ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    String hour =
        (((millisecond ~/ 1000) ~/ 60) ~/ 60).toString().padLeft(2, "0");

    return "$hour:$minutes:$seconds:$milliseconds";
  }

  void add({required SavedLaps lap}) {
    savedLaps.add(lap);
    notifyListeners();
  }

  void remove({required SavedLaps lap}) {
    if (savedLaps.contains(lap)) {
      // logic to make necessary adjustment when deleting lap
      int index = 0;
      savedLaps.asMap().forEach((key, value) {
        if (value.totalLapTime == lap.totalLapTime) {
          index = key;
        }
      });

      if (savedLaps.length - 1 == index) {
        savedLaps.remove(lap);
      } else if (index == 0) {
        savedLaps[index + 1].lapTime = savedLaps[index].lapTime;
        savedLaps.remove(lap);
      } else {
        savedLaps[index + 1].lapTime = sinceLastLapCalculator(
            savedLaps[index - 1].totalLapTime,
            savedLaps[index + 1].totalLapTime);
        savedLaps.remove(lap);
      }
      notifyListeners();
    }
  }

  void pauseOrPlay() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer.cancel();

      notifyListeners();
    } else {
      _stopwatch.start();
      _timer = Timer.periodic(const Duration(milliseconds: 10), (_) {
        notifyListeners();
      });
    }
  }

  void reset() {
    _stopwatch.reset();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class SavedLaps {
  //  final int index;
  String lapTime;
  final String totalLapTime;

  SavedLaps({required this.lapTime, required this.totalLapTime});

}
