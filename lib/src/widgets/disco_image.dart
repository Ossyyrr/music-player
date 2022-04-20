import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:provider/provider.dart';

class DiscoImage extends StatelessWidget {
  const DiscoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: const Duration(seconds: 10),
              infinite: true,
              manualTrigger: true,
              animate: false,
              controller: (animationController) => audioPlayerModel.controller = animationController,
              child: const Image(image: AssetImage('assets/aurora.jpg')),
            ),
            // AnimatedBuilder(
            //   animation: audioPlayerModel.controller,
            //   builder: (_, child) {
            //     return Transform.rotate(
            //       angle: audioPlayerModel.controller.value * 2 * math.pi,
            //       child: child,
            //     );
            //   },
            //   child: const FlutterLogo(size: 200),
            // ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: const Color(0xff1c1c25),
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24),
          ],
        ),
      ),
    );
  }
}
