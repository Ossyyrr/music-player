import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:music_player/src/models/song_model.dart';
import 'package:provider/provider.dart';

class Track extends StatelessWidget {
  const Track({
    Key? key,
    required this.song,
    required this.index,
  }) : super(key: key);
  final Song song;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);
        audioPlayerModel.currentSong = index;
        print('TRACK: ' + song.title);
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.red,
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Image(
                image: AssetImage('assets/motomami.jpeg'),
                fit: BoxFit.contain,
              ),
              Text(
                song.title,
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
