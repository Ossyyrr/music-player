import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:music_player/src/models/song_model.dart';
import 'package:provider/provider.dart';

class TitleTrack extends StatelessWidget {
  const TitleTrack({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Image(
                  image: AssetImage('assets/bg_title.png'),
                  height: 70,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Text(
                  songs[audioPlayerModel.currentSong].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Rosalia',
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 15),
        ),
      ],
    );
  }
}
