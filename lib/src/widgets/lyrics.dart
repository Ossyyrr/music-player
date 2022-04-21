import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/songs.dart';
import 'package:music_player/src/models/song_model.dart';

class Lyrics extends StatelessWidget {
  const Lyrics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Song> songs = getSongs();

    return ListWheelScrollView(
        physics: const BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 2,
        children: songs[0]
            .lyrics
            .map((linea) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      linea,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
                    ),
                  ),
                ))
            .toList());
  }
}
