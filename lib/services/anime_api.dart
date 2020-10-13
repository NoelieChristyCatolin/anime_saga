import 'dart:async';
import 'dart:convert';
import 'package:anime_saga/models/anime/anime_list_data.dart';
import 'package:anime_saga/models/episode/episodes_list_data.dart';
import 'package:http/http.dart' as http;

class AnimeApi {

  // TODO: replace righ api
  Future<AnimeListData> fetchAnimes(String key) async {
    final response = await http.get('https://api.jikan.moe/v3/search/anime?q=$key');
    print('https://api.jikan.moe/v3/search/anime?q=$key');
    if (response.statusCode == 200){
      print("success");
      return AnimeListData.fromJson(jsonDecode(response.body));
    }
    else {
      print("failed");
      throw Exception("Failed to fetchAlbum");
    }
  }

  // TODO: replace righ api
  Future<EpisodesListData> fetchAnimeEpisodes(int id) async {
    final response = await http.get('https://api.jikan.moe/v3/anime/$id/episodes');
    print('https://api.jikan.moe/v3/anime/$id/episodes');
    if (response.statusCode == 200){
      print("success");
      return EpisodesListData.fromJson(jsonDecode(response.body));
    }
    else {
      print("failed");
      throw Exception("Failed to fetchAlbum");
    }
  }

}

