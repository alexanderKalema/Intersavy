import 'package:android_app_development/constants.dart';
import 'package:android_app_development/models/generic_circle.dart';
import 'package:android_app_development/services/stop_watch_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:android_app_development/models/my_appbar.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  @override
  Widget build(BuildContext context) {
    final myNotifier = context.read<DateAndTimeProvider>();

    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context)!.stopWatchApp,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                AppLocalizations.of(context)!.savedLaps,
                style: const TextStyle(fontSize: 24),
              ),
              Container(
                decoration: BoxDecoration(
                  color: SECONDARY_TEXT_COLOR.withOpacity(0.1),
                  border: Border.all(
                    color: MUSIC_NOTE_COLOR.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(AppLocalizations.of(context)!.number),
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(AppLocalizations.of(context)!.overAllLap),
                            const SizedBox(
                              width: 50,
                            ),
                            Text(AppLocalizations.of(context)!.sinceLastLap),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        color: MUSIC_NOTE_COLOR.withOpacity(0.2),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 200,
                        child: myNotifier.savedLaps.isNotEmpty
                            ? ListView.builder(
                                itemCount: myNotifier.savedLaps.length,
                                itemBuilder: (context, index) {
                                  final lap = myNotifier.savedLaps[index];
                                  return ListTile(
                                    leading: Text((index + 1).toString()),
                                    title: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(lap.totalLapTime),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Text(lap.lapTime)
                                      ],
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        myNotifier.remove(lap: lap);
                                        setState(() {});
                                      },
                                    ),
                                  );
                                })
                            : Center(
                                child: Text(
                                  AppLocalizations.of(context)!.noSavedLaps,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              GenericCircle(
                  width: 250,
                  height: 250,
                  isCircle: true,
                  child: Consumer<DateAndTimeProvider>(
                      builder: (context, value, child) {
                    return Center(
                      child: Text(
                        myNotifier.formattedTime,
                        style: const TextStyle(
                          fontFamily: '',
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  })),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Consumer<DateAndTimeProvider>(
                  builder: (context, value, child) {
                    return GenericCircle(
                      width: 70,
                      height: 70,
                      isCircle: true,
                      fillColor: BUTTON_PRIMARY,
                      onTap: myNotifier.pauseOrPlay,
                      child: Icon(
                          myNotifier.isRunning ? Icons.pause : Icons.play_arrow,
                          size: 50,
                          color: MUSIC_NOTE_COLOR),
                    );
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                GenericCircle(
                  width: 70,
                  height: 70,
                  isCircle: true,
                  fillColor: BUTTON_PRIMARY,
                  onTap: () {
                    myNotifier.reset();
                    myNotifier.savedLaps.clear();
                    setState(() {});
                  },
                  child:
                      const Icon(Icons.refresh, size: 50, color: MUSIC_NOTE_COLOR),
                ),
                const SizedBox(
                  width: 15,
                ),
                GenericCircle(
                  width: 100,
                  height: 50,
                  isCircle: false,
                  onTap: () {
                    myNotifier.add(
                        lap: SavedLaps(
                      lapTime: myNotifier.savedLaps.isEmpty
                          ? "-".padLeft(12)
                          : myNotifier.sinceLastLapCalculator(
                              myNotifier.savedLaps.last.totalLapTime,
                              myNotifier.formattedTime),
                      totalLapTime: myNotifier.formattedTime,
                    ));
                    setState(() {});
                  },
                  fillColor: BUTTON_PRIMARY,
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.saveLap,
                      style: const TextStyle(
                        color: MUSIC_NOTE_COLOR,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
