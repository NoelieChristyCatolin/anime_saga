import 'package:anime_saga/models/anime/anime.dart';
import 'package:anime_saga/services/jikan_api.dart';

class AnimeListData{
  List<Anime> animeList = [];
  JikanApi api = JikanApi();

  AnimeListData({this.animeList});


  Future<List<Anime>> fetchAnimes(String key)  async {
    var result = await api.fetchAnimes(key);
    animeList = result;
    return result;
  }
}