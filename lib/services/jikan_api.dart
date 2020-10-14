import 'dart:async';
import 'dart:convert';
import 'package:anime_saga/models/anime/anime_list_data.dart';
import 'package:anime_saga/models/anime/anime.dart';
import 'package:anime_saga/models/episode/episode.dart';
import 'package:anime_saga/models/episode/episodes_list_data.dart';
//import 'package:anime_saga/models/episode/episodes.dart';
import 'package:http/http.dart' as http;

class JikanApi {

  // TODO: check right search query
  Future<List<Anime>> fetchAnimes(String key)  async {
    final response = await http.get('https://api.jikan.moe/v3/search/anime?q=title:$key');
    print('https://api.jikan.moe/v3/search/anime?q=title:$key');
    if (response.statusCode == 200){
      print("success");
      Map<String, dynamic> json = jsonDecode(response.body);
      var results = json['results'] as List;
      List<Anime> animeList = results.map((i) => Anime.fromJson(i)).toList();
      return animeList;
    }
    else {
      print("failed");
      throw Exception("Failed to animes");
    }
  }

  Future<List<Episode>> fetchAnimeEpisodes(int id) async {
    final response = await http.get(
        'https://api.jikan.moe/v3/anime/$id/episodes');
    print('https://api.jikan.moe/v3/anime/$id/episodes');
    if (response.statusCode == 200) {
      print("success");
      Map<String, dynamic> json = jsonDecode(response.body);
      var results = json['episodes'] as List;
      List<Episode> episodesList = results.map((i) => Episode.fromJson(i))
          .toList();
      return episodesList;
    }
  }
}

