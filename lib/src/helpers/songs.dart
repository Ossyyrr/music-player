import 'package:music_player/src/helpers/lyrics.dart';
import 'package:music_player/src/models/song_model.dart';

final _songs = [
  {
    'mp3': 'assets/1-saoko.mp3',
    'title': 'SAOKO',
    'lyrics': saoko,
    'image': '1.jpeg',
  },
  {
    'mp3': 'assets/2-candy.mp3',
    'title': 'CANDY',
    'lyrics': candy,
    'image': '2.jpeg',
  },
  {
    'mp3': 'assets/3-la-fama.mp3',
    'title': 'LA FAMA',
    'lyrics': laFama,
    'image': '3.jpeg',
  },
  {
    'mp3': 'assets/4-bulerias.mp3',
    'title': 'BULERIAS',
    'lyrics': bulerias,
    'image': '4.jpeg',
  },
  {
    'mp3': 'assets/5-chiken-teriyaki.mp3',
    'title': 'CHIKEN TERIYAKI',
    'lyrics': chikenTeriyaki,
    'image': '5.jpeg',
  },
  {
    'mp3': 'assets/6-hentai.mp3',
    'title': 'HENTAI',
    'lyrics': hentai,
    'image': '6.jpeg',
  },
  {
    'mp3': 'assets/7-bizcochito.mp3',
    'title': 'BIZCOCHITO',
    'lyrics': bizcochito,
    'image': '7.jpeg',
  },
  {
    'mp3': 'assets/8-g3-n15.mp3',
    'title': 'G3 N15',
    'lyrics': g3n15,
    'image': '8.jpeg',
  },
  {
    'mp3': 'assets/9-motomami.mp3',
    'title': 'MOTOMAMI',
    'lyrics': motomami,
    'image': '9.jpeg',
  },
  {
    'mp3': 'assets/10-diablo.mp3',
    'title': 'DIABLO',
    'lyrics': diablo,
    'image': '10.jpeg',
  },
  {
    'mp3': 'assets/11-delirio-de-grandeza.mp3',
    'title': 'DELIRIO DE GRANDEZA',
    'lyrics': delirioDeGrandeza,
    'image': '11.jpeg',
  },
  {
    'mp3': 'assets/12-cuuuuuuuuuute.mp3',
    'title': 'CUUUUuuuuuute',
    'lyrics': cuuuuuuuuuute,
    'image': '12.jpeg',
  },
  {
    'mp3': 'assets/13-como-un-g.mp3',
    'title': 'COMO UN G',
    'lyrics': comoUnG,
    'image': '13.jpeg',
  },
  {
    'mp3': 'assets/14-abcdefg.mp3',
    'title': 'Abcdefg',
    'lyrics': abcdefg,
    'image': '14.jpeg',
  },
  {
    'mp3': 'assets/15-la-combi-versace.mp3',
    'title': 'La combi versace',
    'lyrics': laConviVersace,
    'image': '15.jpeg',
  },
  {
    'mp3': 'assets/16-sakura.mp3',
    'title': 'SAKURA',
    'lyrics': sakura,
    'image': '16.jpeg',
  },
];

List<Song> getSongs() {
  List<Song> songList = [];
  for (var song in _songs) {
    songList.add(Song.fromMap(song));
  }

  return songList;
}
