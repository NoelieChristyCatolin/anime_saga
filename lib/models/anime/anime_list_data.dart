import 'package:anime_saga/models/anime/anime.dart';

class AnimeListData{
  List<Anime> animeList = [];

  AnimeListData({this.animeList});

  factory AnimeListData.fromJson(Map<String, dynamic> json) {
    var results = json['results'] as List;
    List<Anime> animeList = results.map((i) => Anime.fromJson(i)).toList();
    print(animeList.length);
    return AnimeListData(animeList: animeList);
  }

}