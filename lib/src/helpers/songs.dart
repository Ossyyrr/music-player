import 'package:music_player/src/helpers/lyrics.dart';
import 'package:music_player/src/models/song_model.dart';

final _songs = [
  {
    'mp3': 'assets/1-saoko.mp3',
    'title': 'SAOKO',
    'lyrics': saoko,
  },
  {
    'mp3': 'assets/2-candy.mp3',
    'title': 'CANDY',
    'lyrics': candy,
  },
  {
    'mp3': 'assets/3-la-fama.mp3',
    'title': 'LA FAMA',
    'lyrics': laFama,
  },
  {
    'mp3': 'assets/4-bulerias.mp3',
    'title': 'BULERIAS',
    'lyrics': bulerias,
  },
  {
    'mp3': 'assets/5-chiken-teriyaki.mp3',
    'title': 'CHIKEN TERIYAKI',
    'lyrics': chikenTeriyaki,
  },
  {
    'mp3': 'assets/6-hentai.mp3',
    'title': 'HENTAI',
    'lyrics': hentai,
  },
  {
    'mp3': 'assets/7-bizcochito.mp3',
    'title': 'BIZCOCHITO',
    'lyrics': bizcochito,
  },
  {
    'mp3': 'assets/8-g3-n15.mp3',
    'title': 'G3 N15',
    'lyrics': g3n15,
  },
  {
    'mp3': 'assets/9-motomami.mp3',
    'title': 'MOTOMAMI',
    'lyrics': laConviVersace,
  },
  {
    'mp3': 'assets/10-diablo.mp3',
    'title': 'DIABLO',
    'lyrics': diablo,
  },
  {
    'mp3': 'assets/11-delirio-de-grandeza.mp3',
    'title': 'DELIRIO DE GRANDEZA',
    'lyrics': delirioDeGrandeza,
  },
  {
    'mp3': 'assets/12-cuuuuuuuuuute.mp3',
    'title': 'CUUUUuuuuuute',
    'lyrics': cuuuuuuuuuute,
  },
  {
    'mp3': 'assets/13-como-un-g.mp3',
    'title': 'COMO UN G',
    'lyrics': comoUnG,
  },
  {
    'mp3': 'assets/14-abcdefg.mp3',
    'title': 'Abcdefg',
    'lyrics': abcdefg,
  },
  {
    'mp3': 'assets/15-la-combi-versace.mp3',
    'title': 'La combi versace',
    'lyrics': laConviVersace,
  },
  {
    'mp3': 'assets/16-sakura.mp3',
    'title': 'SAKURA',
    'lyrics': sakura,
  },
];

List<Song> getSongs() {
  List<Song> songList = [];
  for (var song in _songs) {
    songList.add(Song.fromMap(song));
  }

  return songList;
}
