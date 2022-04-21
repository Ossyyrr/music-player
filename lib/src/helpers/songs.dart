import 'package:music_player/src/helpers/lyrics.dart';
import 'package:music_player/src/models/song_model.dart';

final _songs = [
  {
    'mp3': 'assets/15-la-combi-versace.mp3',
    'title': 'La combi versace',
    'lyrics': laConviVersace,
  },
  {
    'mp3': 'assets/1-saoko.mp3',
    'title': 'Saoko',
    'lyrics': saoko,
  },
];

List<Song> getSongs() {
  List<Song> songList = [];
  for (var song in _songs) {
    songList.add(Song.fromMap(song));
  }

  return songList;
}
