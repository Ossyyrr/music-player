import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:provider/provider.dart';

class TituloPlay extends StatefulWidget {
  const TituloPlay({
    Key? key,
  }) : super(key: key);

  @override
  State<TituloPlay> createState() => _TituloPlayState();
}

class _TituloPlayState extends State<TituloPlay> with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTime = true;
  late AnimationController playAnimation;
  final assetAudioPlayer = AssetsAudioPlayer();

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

  void open() {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);

    assetAudioPlayer.open(Audio('assets/Breaking-Benjamin-Far-Away.mp3'), autoStart: true, showNotification: true);

    assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.current = duration;
    });

    assetAudioPlayer.current.listen((playingAudio) {
      audioPlayerModel.songDuration = playingAudio?.audio.duration ?? const Duration(seconds: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Far Away',
                style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 30),
              ),
              Text(
                '-Breaking Benjamin-',
                style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 15),
              ),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
              elevation: 0,
              highlightElevation: 0,
              onPressed: () {
                final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);

                if (isPlaying) {
                  playAnimation.reverse();
                  isPlaying = false;
                  audioPlayerModel.controller.stop();
                } else {
                  playAnimation.forward();
                  isPlaying = true;
                  audioPlayerModel.controller.repeat();
                }
                if (firstTime) {
                  open();
                  firstTime = false;
                } else {
                  assetAudioPlayer.playOrPause();
                }
              },
              backgroundColor: const Color(0xfff8cb51),
              child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: playAnimation))
        ],
      ),
    );
  }
}