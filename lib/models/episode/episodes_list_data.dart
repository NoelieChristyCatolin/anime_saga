import 'package:anime_saga/models/episode/episode.dart';
import 'package:anime_saga/services/jikan_api.dart';

class EpisodesListData{
  List<Episode> episodesList = [];
  JikanApi api = JikanApi();
  EpisodesListData({this.episodesList});

  Future<List<Episode>> fetchAnimeEpisodes(int id) async {
    var result = await api.fetchAnimeEpisodes(id);
    episodesList = result;
    return result;
  }
}
