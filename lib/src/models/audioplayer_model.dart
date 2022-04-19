import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  final bool _playing = false;

  late AnimationController _controller;

  set controller(AnimationController valor) {
    _controller = valor;
  }

  AnimationController get controller => _controller;
}
