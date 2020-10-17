import 'dart:async';
import 'dart:convert';
import 'package:anime_saga/models/anime/anime.dart';
import 'package:anime_saga/models/episode/episode.dart';
import 'package:http/http.dart' as http;

class JikanApi {
  final String basuURL = 'https://api.jikan.moe/v3';
  http.Client httpClient  =  http.Client();

//  JikanApi({this.httpClient =  http.Client()});

  // TODO: check right search query
  Future<List<Anime>> fetchAnimes(String key)  async {
    final response = await httpClient.get('$basuURL/search/anime?q=title:$key');
    if (response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body);
      var results = json['results'] as List;
      List<Anime> animeList = results.map((i) => Anime.fromJson(i)).toList();
      return animeList;
    }
    else if (response.statusCode == 429) {
      throw Exception('Rate limit is reached.');
    }
    else {
      throw Exception("Failed to fetch anime.");
    }
  }

  Future<List<Episode>> fetchAnimeEpisodes(int id) async {
    final response = await httpClient.get('$basuURL/anime/$id/episodes');
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      var results = json['episodes'] as List;
      List<Episode> episodesList = results.map((i) => Episode.fromJson(i)).toList();
      return episodesList;
    }
    else if (response.statusCode == 429) {
      throw Exception('Rate limit is reached.');
    }
    else {
      throw Exception("Failed to fetch episodes.");
    }
  }
}

