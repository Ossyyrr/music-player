import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/songs.dart';
import 'package:music_player/src/models/song_model.dart';
import 'package:music_player/src/widgets/background.dart';
import 'package:music_player/src/widgets/disco_image.dart';
import 'package:music_player/src/widgets/lyrics.dart';
import 'package:music_player/src/widgets/play_button.dart';
import 'package:music_player/src/widgets/progress_bar.dart';
import 'package:music_player/src/widgets/scroll_track.dart';
import 'package:music_player/src/widgets/title_track.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Song> songs = getSongs();

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              const Background(),
              Column(
                children: [
                  const ScrollTrack(),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const DiscoImage(),
                            TitleTrack(songs: songs),
                          ],
                        ),
                        const SizedBox(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            ProgressBar(),
                            PlayButton(),
                          ],
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Expanded(child: Lyrics()),
        ],
      ),
    ));
  }
}
