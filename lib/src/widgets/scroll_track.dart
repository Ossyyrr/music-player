import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/songs.dart';
import 'package:music_player/src/models/song_model.dart';
import 'package:music_player/src/widgets/track.dart';

class ScrollTrack extends StatelessWidget {
  const ScrollTrack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Song> songs = getSongs();

    return SizedBox(
        height: 120,
        width: double.infinity,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            
          scrollDirection: Axis.horizontal,
          itemCount: songs.length, 
          itemBuilder: (context, index) {
            return Track(song: songs[index], index: index);
          },
        ));
  }
}
