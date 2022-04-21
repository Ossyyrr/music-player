import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final estilo = TextStyle(color: Colors.white.withOpacity(0.4));
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final porcentaje = audioPlayerModel.porcentaje;
    const progressBarHeight = 200.0;
    return Column(
      children: [
        Text(audioPlayerModel.songTotalDuration, style: estilo),
        const SizedBox(width: 20),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 3,
              height: progressBarHeight,
              color: Colors.white.withOpacity(0.2),
            ),
            Container(
              width: 3,
              height: progressBarHeight * porcentaje,
              color: Colors.white.withOpacity(0.8),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Text(audioPlayerModel.currentSecond, style: estilo),
      ],
    );
  }
}
