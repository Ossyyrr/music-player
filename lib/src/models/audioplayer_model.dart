import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/songs.dart';
import 'package:music_player/src/models/song_model.dart';

class AudioPlayerModel with ChangeNotifier {
  int _currentSong = 0;

  bool _playing = false;
  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _current = const Duration(milliseconds: 0);

  String get songTotalDuration => printDuration(songDuration);
  String get currentSecond => printDuration(current);

  double get porcentaje => (songDuration.inSeconds > 0) ? _current.inSeconds / _songDuration.inSeconds : 0;

  final assetAudioPlayer = AssetsAudioPlayer();

  late AnimationController _imageDiscoController;
  AnimationController get imageDiscoController => _imageDiscoController;
  set imageDiscoController(AnimationController valor) {
    _imageDiscoController = valor;
  }

  int get currentSong => _currentSong;
  set currentSong(int valor) {
    _currentSong = valor;
    _songDuration = const Duration(milliseconds: 0);
    _current = const Duration(milliseconds: 0);
    open();
    notifyListeners();
  }

  bool get playing => _playing;
  set playing(bool valor) {
    _playing = valor;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;
  set songDuration(Duration valor) {
    _songDuration = valor;
    notifyListeners();
  }

  Duration get current => _current;
  set current(Duration valor) {
    _current = valor;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void open() {
    final List<Song> songs = getSongs();

    assetAudioPlayer.open(Audio(songs[currentSong].mp3), autoStart: true, showNotification: true);

    assetAudioPlayer.currentPosition.listen((duration) {
      current = duration;
    });

    assetAudioPlayer.current.listen((playingAudio) {
      songDuration = playingAudio?.audio.duration ?? const Duration(seconds: 0);
    });
  }
}
