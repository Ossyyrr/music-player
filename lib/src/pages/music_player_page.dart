import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

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
              CustomAppbar(),
              ImageDiscoDuration(),
              TituloPlay(),
              Expanded(child: Lyrics()),
            ],
          ),
        ],
      ),
    ));
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff33333e),
            Color(0xff201e28),
          ],
        ),
      ),
    );
  }
}

class Lyrics extends StatelessWidget {
  const Lyrics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();

    return ListWheelScrollView(
        physics: const BouncingScrollPhysics(),
        itemExtent: 42,
        diameterRatio: 2,
        children: lyrics
            .map((linea) => Text(
                  linea,
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20),
                ))
            .toList());
  }
}

class TituloPlay extends StatefulWidget {
  const TituloPlay({
    Key? key,
  }) : super(key: key);

  @override
  State<TituloPlay> createState() => _TituloPlayState();
}

class _TituloPlayState extends State<TituloPlay> with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController playAnimation;

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
                setState(() {});
              },
              backgroundColor: const Color(0xfff8cb51),
              child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: playAnimation))
        ],
      ),
    );
  }
}

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
          ImagenDisco(),
          BarraProgres(),
        ],
      ),
    );
  }
}

class BarraProgres extends StatelessWidget {
  const BarraProgres({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final estilo = TextStyle(color: Colors.white.withOpacity(0.4));
    return Container(
      child: Column(
        children: [
          Text('00:00', style: estilo),
          const SizedBox(width: 20),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.2),
              ),
              Container(
                width: 3,
                height: 100,
                color: Colors.white.withOpacity(0.8),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Text('00:00', style: estilo),
        ],
      ),
    );
  }
}

class ImagenDisco extends StatelessWidget {
  const ImagenDisco({
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
              controller: (animationController) => audioPlayerModel.controller = animationController,
              child: const Image(image: AssetImage('assets/aurora.jpg')),
            ),
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
