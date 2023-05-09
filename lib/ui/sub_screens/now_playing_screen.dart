import 'package:android_app_development/constants.dart';
import 'package:android_app_development/models/generic_circle.dart';
import 'package:android_app_development/models/my_appbar.dart';
import 'package:android_app_development/services/music_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:android_app_development/services/app_router.gr.dart';

class NowPlaying extends StatefulWidget {
  final CustomSound customSound;
  final SoundsList soundsList;

  const NowPlaying(
      {Key? key, required this.customSound, required this.soundsList})
      : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  void didChangeDependencies() {
    widget.customSound.initalize();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var musicInstance = widget.soundsList;
    return ChangeNotifierProvider(
      create: (context) => widget.customSound,
      child: Consumer<CustomSound>(builder: (context, value, child) {
        return Scaffold(
          appBar: MyAppBar(
            title: AppLocalizations.of(context)!.nowPlaying,
          ),
          body: SizedBox.expand(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const GenericCircle(
                  height: 350,
                  width: double.infinity,
                  isCircle: false,
                  fillColor: BUTTON_PRIMARY,
                  child: Padding(
                    padding: EdgeInsets.all(70.0),
                    child: GenericCircle(
                      height: 20,
                      width: 20,
                      isCircle: true,
                      child: Icon(
                        Icons.music_note_sharp,
                        size: 150,
                        color: MUSIC_NOTE_COLOR,
                      ),
                    ),
                  ),
                ),
                Text(
                  "${AppLocalizations.of(context)!.name}: ${value.songName}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "${AppLocalizations.of(context)!.artist}: ${value.artistName}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Slider(
                            min: const Duration(milliseconds: 0)
                                .inSeconds
                                .toDouble(),
                            value: value.position.inSeconds.toDouble(),
                            max: value.duration.inSeconds.toDouble(),
                            onChanged: (val) {
                              value.changeToSeconds(val.toInt());
                              value = value;
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              value.positionTime,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              value.durationTime,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GenericCircle(
                      height: 70,
                      width: 70,
                      fillColor: BUTTON_PRIMARY,
                      isCircle: true,
                      child: const Icon(
                        Icons.skip_previous,
                        size: 50,
                        color: MUSIC_NOTE_COLOR,
                      ),
                      onTap: () {
                        value.playOrPauseSong();
                        context.router.popAndPush(NowPlayingRoute(
                            soundsList: musicInstance,
                            customSound:
                                musicInstance.getPreviousSound(value)));
                      },
                    ),
                    GenericCircle(
                      height: 70,
                      width: 70,
                      fillColor: BUTTON_PRIMARY,
                      isCircle: true,
                      child: Icon(
                        value.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 50,
                        color: MUSIC_NOTE_COLOR,
                      ),
                      onTap: () {
                        value.playOrPauseSong();
                      },
                    ),
                    GenericCircle(
                      height: 70,
                      width: 70,
                      fillColor: BUTTON_PRIMARY,
                      isCircle: true,
                      onTap: () {
                        value.playOrPauseSong();
                        context.router.popAndPush(NowPlayingRoute(
                            soundsList: musicInstance,
                            customSound: musicInstance.getNextSound(value)));
                      },
                      child: const Icon(
                        Icons.skip_next,
                        size: 50,
                        color: MUSIC_NOTE_COLOR,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        );
      }),
    );
  }
}
