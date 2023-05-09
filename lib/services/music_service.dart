import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SoundsList extends ChangeNotifier {
  final List<SongModel> allSounds;

  SoundsList(this.allSounds);

  CustomSound atIndex(int index) => CustomSound(model: allSounds[index]);

  CustomSound getNextSound(CustomSound currentSound) {
    int currInd = allSounds.indexOf(currentSound.model);

    (currInd < allSounds.length) ? currInd++ : currInd = 0;
    currentSound.audioPlayer.stop();
    CustomSound nextSound = CustomSound(
      model: allSounds[currInd],
    );
    nextSound.initalize();
    nextSound.playOrPauseSong();
    return nextSound;
  }

  CustomSound getPreviousSound(CustomSound currentSound) {
    int currInd = allSounds.indexOf(currentSound.model);

    (currInd == 0) ? currInd = allSounds.length - 1 : currInd--;
    currentSound.audioPlayer.stop();
    CustomSound nextSound = CustomSound(
      model: allSounds[currInd],
    );
    nextSound.initalize();
    nextSound.playOrPauseSong();
    return nextSound;
  }
}

class CustomSound extends ChangeNotifier {
  final String songName;
  final String artistName;
  final String uri;
  final int _duration;
  final AudioPlayer audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration position = const Duration();
  Duration duration = const Duration();
  double _value = 0.0;
  final SongModel model;

  CustomSound({required this.model})
      : artistName = model.artist ?? 'UNKOWN',
        songName = model.displayNameWOExt,
        _duration = model.duration ?? 0,
        uri = model.uri!;

  bool get isPlaying => _isPlaying;

  double get value => _value;

  String get positionTime =>
      "${(((position.inSeconds ~/ 60) ~/ 60)%60).toString().padLeft(2, "0")}:${((position.inSeconds ~/ 60)%60).toString().padLeft(2, "0")}:${(position.inSeconds % 60).toString().padLeft(2, "0")}";

  String get durationTime =>
      " ${((((_duration ~/ 1000) ~/ 60) ~/ 60)% 60).toString().padLeft(2, "0")}:${(((_duration ~/ 1000) ~/ 60)%60).toString().padLeft(2, "0")}:${((_duration ~/ 1000) % 60).toString().padLeft(2, "0")}";

  set value(double newValue) {
    if (newValue != _value) {
      _value = newValue;
      notifyListeners();
    }
  }

  Future<void> initalize() async {
    await audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri)));
    playOrPauseSong();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void changeToSeconds(int seconds) {
    Duration duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }

  Future<void> playOrPauseSong() async {
    try {
      if (_isPlaying) {
        _isPlaying = !_isPlaying;
        audioPlayer.pause();
        notifyListeners();
      } else {
        audioPlayer.play();
        _isPlaying = !_isPlaying;
        notifyListeners();
      }

      audioPlayer.positionStream.listen((pos) {
        position = pos;
        notifyListeners();
      });
      audioPlayer.durationStream.listen((dur) {
        duration = dur!;
        notifyListeners();
      });
      return;
    } on Exception {
      print('Error parsing song');
    }
  }
}

class SoundsListInheritedNotifier extends InheritedNotifier<SoundsList> {
  const SoundsListInheritedNotifier(
      {Key? key, required SoundsList soundsList, required Widget child})
      : super(key: key, notifier: soundsList, child: child);

  static SoundsList? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SoundsListInheritedNotifier>()
        ?.notifier;
  }

  @override
  bool updateShouldNotify(covariant InheritedNotifier<SoundsList> oldWidget) {
    return true;
  }
}
