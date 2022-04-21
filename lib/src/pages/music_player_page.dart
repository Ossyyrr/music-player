import 'package:flutter/material.dart';
import 'package:music_player/src/widgets/background.dart';
import 'package:music_player/src/widgets/image_disco_duration.dart';
import 'package:music_player/src/widgets/lyrics.dart';
import 'package:music_player/src/widgets/scroll_track.dart';
import 'package:music_player/src/widgets/titulo_play.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          const Background(),
          Column(
            children: const [
              //   CustomAppbar(),
              //   SizedBox(height: 25),
              ScrollTrack(),
              ImageDiscoDuration(),
              TituloPlay(),
              SizedBox(height: 25),
              Expanded(child: Lyrics()),
            ],
          ),
        ],
      ),
    ));
  }
}
