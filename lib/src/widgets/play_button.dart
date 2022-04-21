import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/songs.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:music_player/src/models/song_model.dart';
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

    return SizedBox(
        child: FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            onPressed: () {
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
            )));
  }

  void open() {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);

    final List<Song> songs = getSongs();

    List<Audio> audios = [];
    for (var song in songs) {
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
      audioPlayerModel.currentSong = audioPlayerModel.currentSong + 1;
    });
  }
}
