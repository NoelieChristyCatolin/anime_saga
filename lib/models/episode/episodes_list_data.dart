import 'package:anime_saga/models/episode/episode.dart';

class EpisodesListData{
  List<Episode> episodesList = [];

  EpisodesListData({this.episodesList});

  factory EpisodesListData.fromJson(Map<String, dynamic> json) {
    var results = json['episodes'] as List;
    List<Episode> episodeList = results.map((i) => Episode.fromJson(i)).toList();
    return EpisodesListData(episodesList: episodeList);
  }

}