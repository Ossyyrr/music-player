import 'package:flutter/material.dart';
import 'package:music_player/src/widgets/background.dart';
import 'package:music_player/src/widgets/image_disco_duration.dart';
import 'package:music_player/src/widgets/lyrics.dart';
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
              ScrollDisco(),
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

class ScrollDisco extends StatelessWidget {
  const ScrollDisco({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Song(),
          Song(),
          Song(),
          Song(),
          Song(),
          Song(),
          Song(),
          Song(),
        ],
      ),
    );
  }
}

class Song extends StatelessWidget {
  const Song({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        color: Colors.red,
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Image(
              image: AssetImage('assets/motomami.jpeg'),
              fit: BoxFit.contain,
            ),
            Text('Cancion x')
          ],
        ));
  }
}
