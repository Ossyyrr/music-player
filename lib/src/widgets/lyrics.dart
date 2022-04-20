import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/helpers.dart';

class Lyrics extends StatelessWidget {
  const Lyrics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();

    return ListWheelScrollView(
        physics: const BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 2,
        children: lyrics
            .map((linea) => Text(
                  linea,
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
                ))
            .toList());
  }
}
