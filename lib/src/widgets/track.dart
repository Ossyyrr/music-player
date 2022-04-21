import 'package:flutter/material.dart';
import 'package:music_player/src/models/audioplayer_model.dart';
import 'package:music_player/src/models/song_model.dart';
import 'package:provider/provider.dart';

class Track extends StatelessWidget {
  const Track({
    Key? key,
    required this.song,
    required this.index,
  }) : super(key: key);
  final Song song;
  final int index;
  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    bool isSelected = audioPlayerModel.currentSong == index;
    return GestureDetector(
      onTap: () {
        final audioPlayerModel = Provider.of<AudioPlayerModel>(context, listen: false);
        audioPlayerModel.currentSong = index;
        print('TRACK: ' + song.title);
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: isSelected ? 1 : 0.8,
        alignment: Alignment.topCenter,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  isSelected ? const Color(0xffec3f41) : const Color(0xff484750),
                  const Color(0xff1E1C24),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //     color: isSelected ? const Color(0xffec3f41).withOpacity(0.1) : Colors.transparent,
              //     spreadRadius: 5,
              //     blurRadius: 5,
              //     offset: const Offset(0, -7), // changes position of shadow
              //   ),
              // ],
            ),
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  height: 85,
                  width: 100,
                  image: AssetImage('assets/${song.image}'),
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      song.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
