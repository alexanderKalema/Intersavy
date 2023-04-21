import 'package:android_app_development/services/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:android_app_development/services/permission_handling_service.dart';
import 'package:android_app_development/models/my_appbar.dart';
import 'package:android_app_development/services/music_service.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(
          title: "Music App",
        ),
        body: SizedBox.expand(
          child: FutureBuilder<PermissionStatus>(
              future: requestPermission(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return FutureBuilder<List<SongModel>>(
                      future: _audioQuery.querySongs(
                        sortType: null,
                        orderType: OrderType.ASC_OR_SMALLER,
                        uriType: UriType.EXTERNAL,
                        ignoreCase: true,
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.data!.isEmpty) {
                          return const Center(child: Text("No song found!"));
                        } else {
                          return SoundsListInheritedNotifier(
                            soundsList: SoundsList(
                              snapshot.data!,
                            ),
                            child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (cont, index) {
                                  final instance =
                                      SoundsListInheritedNotifier.of(cont)!;
                                  final current = instance.atIndex(index);
                                  return ListTile(
                                    isThreeLine: true,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                                    title: Text(current.songName),
                                    subtitle: Text(current.artistName),
                                    leading: const Icon(Icons.music_note),
                                    trailing: Text(current.durationTime),
                                    onTap: () {
                                      context.router.push(NowPlayingRoute(
                                          soundsList: instance,
                                          customSound: current));
                                    },
                                  );
                                }),
                          );
                        }
                      });
                }
              }),
        ));
  }
}
