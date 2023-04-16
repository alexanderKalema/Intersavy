import 'package:android_app_development/models/generic_circle.dart';
import 'package:android_app_development/services/stop_watch_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      appBar: const MyAppBar(
        title: "Stop Watch App",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Saved Laps",
                style: TextStyle(fontSize: 24),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Text('#'),
                      title: Row(
                        children: const [
                          Text("Overall lap"),
                          SizedBox(
                            width: 60,
                          ),
                          Text("Since last lap"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1.0,
                        // width:Sizes.getTotalWidth(context)*0.2,
                        color: Colors.black.withOpacity(0.2),
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
                                          width: 40,
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
                            : const Center(
                                child: Text(
                                  " No saved laps , use button to save lap",
                                  style: TextStyle(fontSize: 16),
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
                    return Text(
                      myNotifier.formattedTime,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
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
                      onTap: myNotifier.pauseOrPlay,
                      child: Icon(
                        myNotifier.isRunning ? Icons.pause : Icons.play_arrow,
                        size: 50,
                      ),
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
                  onTap: () {
                    myNotifier.reset();
                    myNotifier.savedLaps.clear();
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.refresh,
                    size: 50,
                  ),
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
                  fillColor: Colors.blue,
                  child: const Text(
                    "Save Lap",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
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
