// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Song {
  late String mp3;
  late String title;
  late List<String> lyrics;
  Song({
    required this.mp3,
    required this.title,
    required this.lyrics,
  });

  Song copyWith({
    String? mp3,
    String? title,
    List<String>? lyrics,
  }) {
    return Song(
      mp3: mp3 ?? this.mp3,
      title: title ?? this.title,
      lyrics: lyrics ?? this.lyrics,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mp3': mp3,
      'title': title,
      'lyrics': lyrics,
    };
  }

  factory Song.fromMap(Map<String, dynamic> map) {
    return Song(
      mp3: map['mp3'],
      title: map['title'],
      lyrics: map['lyrics'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Song.fromJson(String source) => Song.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Song(mp3: $mp3, title: $title, lyrics: $lyrics)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Song && other.mp3 == mp3 && other.title == title && other.lyrics == lyrics;
  }

  @override
  int get hashCode => mp3.hashCode ^ title.hashCode ^ lyrics.hashCode;
}
