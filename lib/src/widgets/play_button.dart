import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
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
  late AnimationController playAnimation;

  @override
  void initState() {
    playAnimation = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    open();
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
        padding: const EdgeInsets.only(bottom: 8),
        child: GestureDetector(
          onTap: () {
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
          onHorizontalDragEnd: (DragEndDetails drag) {
            if (drag.primaryVelocity == null) return;
            if (drag.primaryVelocity! < 0) {
              // drag from right to left
              audioPlayerModel.assetAudioPlayer.previous().then(
                  (value) => audioPlayerModel.currentSong = audioPlayerModel.assetAudioPlayer.current.value!.index);
            } else {
              // drag from left to right
              audioPlayerModel.assetAudioPlayer.next().then(
                  (value) => audioPlayerModel.currentSong = audioPlayerModel.assetAudioPlayer.current.value!.index);
            }
          },
          child: Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                color: const Color(0xff201e28),
                progress: playAnimation,
              )),
        ));
  }

  void open() {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);

    List<Audio> audios = [];
    for (var song in audioPlayerModel.songs) {
      audios.add(Audio(song.mp3));
    }

    audioPlayerModel.assetAudioPlayer.open(
      Playlist(audios: audios),
      loopMode: LoopMode.playlist,
    );

    audioPlayerModel.assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.current = duration;
    });

    audioPlayerModel.assetAudioPlayer.current.listen((playingAudio) {
      audioPlayerModel.songDuration = playingAudio?.audio.duration ?? const Duration(seconds: 0);
    });

    audioPlayerModel.assetAudioPlayer.playlistAudioFinished.listen((event) {
      print('AUDIO FINISHED');
      audioPlayerModel.currentSong = audioPlayerModel.currentSong + 1;
    });
  }
}
