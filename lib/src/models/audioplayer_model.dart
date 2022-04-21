import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  int _currentSong = 0;

  bool _playing = false;
  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _current = const Duration(milliseconds: 0);

  String get songTotalDuration => printDuration(songDuration);
  String get currentSecond => printDuration(current);

  double get porcentaje => (songDuration.inSeconds > 0) ? _current.inSeconds / _songDuration.inSeconds : 0;

  late AnimationController _controller;
  AnimationController get controller => _controller;
  set controller(AnimationController valor) {
    _controller = valor;
  }

  int get currentSong => _currentSong;
  set currentSong(int valor) {
    _currentSong = valor;
    _songDuration = const Duration(milliseconds: 0);
    _current = const Duration(milliseconds: 0);
    // controller.dispose();
    print('CURRENT SONG: ' + valor.toString());
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
}
