import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:music_player/src/widgets/track.dart';
import 'package:provider/provider.dart';

class ScrollTrack extends StatelessWidget {
  const ScrollTrack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return SizedBox(
        height: 120,
        width: double.infinity,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: audioPlayerModel.songs.length,
          itemBuilder: (context, index) {
            return Track(song: audioPlayerModel.songs[index], index: index);
          },
        ));
  }
}
