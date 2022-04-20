import 'package:flutter/material.dart';
import 'package:music_player/src/widgets/disco_image.dart';
import 'package:music_player/src/widgets/progress_bar.dart';

class ImageDiscoDuration extends StatelessWidget {
  const ImageDiscoDuration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          DiscoImage(),
          ProgressBar(),
        ],
      ),
    );
  }
}
