import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/songs.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:music_player/src/models/song_model.dart';
import 'package:music_player/src/widgets/title_track.dart';
import 'package:provider/provider.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTime = true;
  late AnimationController playAnimation;
  final List<Song> songs = getSongs();

  @override
  void initState() {
    playAnimation = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);

    // TODO Colocar este código (Pausa o reactiva el disco al cambiar de canción mediante el provider.)
    if (audioPlayerModel.assetAudioPlayer.isPlaying.value) {
      playAnimation.forward(); // icono play
      audioPlayerModel.imageDiscoController.repeat(); // imagen disco
      isPlaying = true;
    } else {
      audioPlayerModel.imageDiscoController.stop(); // imagen disco
      playAnimation.reverse(); // icono play
      isPlaying = false;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      margin: const EdgeInsets.only(top: 40),
      width: double.infinity,
      child: Row(
        children: [
          TitleTrack(songs: songs),
          const Spacer(),
          FloatingActionButton(
              elevation: 0,
              highlightElevation: 0,
              onPressed: () {
                if (firstTime) {
                  audioPlayerModel.open();
                  firstTime = false;
                }
                if (isPlaying) {
                  playAnimation.reverse(); // icono play
                  audioPlayerModel.imageDiscoController.stop(); // imagen disco
                  audioPlayerModel.assetAudioPlayer.pause(); // musica
                  isPlaying = false;
                } else {
                  playAnimation.forward(); // icono play
                  audioPlayerModel.imageDiscoController.repeat(); // imagen disco
                  audioPlayerModel.assetAudioPlayer.play(); // musica
                  isPlaying = true;
                }
              },
              backgroundColor: Colors.white,
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: playAnimation,
              ))
        ],
      ),
    );
  }
}
