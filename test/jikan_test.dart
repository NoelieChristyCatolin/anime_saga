import 'package:anime_saga/models/anime/anime.dart';
import 'package:anime_saga/models/episode/episode.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:anime_saga/services/jikan_api.dart';

class MockClient extends Mock implements http.Client {}

main(){
  final client = MockClient();
  final api = JikanApi(httpClient: client);
  String basuURL = 'https://api.jikan.moe/v3';

  group('fetch anime', (){
    test('As a user, when i search for an anime title (only title) a list of anime list will be given', () async {
      String responseJson = '{"results": [{"mal_id": 1,"title": "Cowboy Bebop"}]}';

      when(client.get('$basuURL/search/anime?q=title:Cowboy')).thenAnswer((_) async => http.Response(responseJson, 200));

      expect(await api.fetchAnimes("Cowboy"), isA<List<Anime>>());
    });

    test('As a user, when i search for an anime title (only title) and there is no match, there should be user friendly error', () async {
      String responseJson = '{"results": []}';

      when(client.get('$basuURL/search/anime?q=title:Cowboy')).thenAnswer((_) async => http.Response(responseJson, 200));

      expect(await api.fetchAnimes("Cowboy"), isEmpty );
    });

    test('As a user, when i search for an anime title (only title) and rate limit is reached , list should be empty', () async {
      String responseJson = 'Rate limit is reached..';

      when(client.get('$basuURL/search/anime?q=title:Cowboy')).thenAnswer((_) async => http.Response(responseJson, 429));

      expect(api.fetchAnimes("Cowboy"), throwsException);
    });

    test('As a user, when i fetch for the anime list and server could not find the requested website', () async {
      String responseJson = 'Failed to fetch anime.';

      when(client.get('$basuURL/search/anime?q=title:Cowboy')).thenAnswer((_) async => http.Response(responseJson, 404));

      expect(api.fetchAnimes("Cowboy"), throwsException);
    });
  });

  group('fetch Episodes', (){
    test('As a user, when i fetch for the episodes list will be given', () async {
      String responseJson = '{"episodes": [{"episode_id": 1,"title": "Cowboy Bebop", "aired": "1998-10-24T00:00:00+00:00", "filler": false}]}';

      when(client.get('$basuURL/anime/1/episodes')).thenAnswer((_) async => http.Response(responseJson, 200));

      expect(await api.fetchAnimeEpisodes(1), isA<List<Episode>>());
    });

    test('As a user, when i fetch for the episodes list should be empty', () async {
      String responseJson = '{"episodes": []}';

      when(client.get('$basuURL/anime/1/episodes')).thenAnswer((_) async => http.Response(responseJson, 200));

      expect(await api.fetchAnimeEpisodes(1), isEmpty );
    });

    test('As a user, when i fetch for the episodes list and rate limit is reached there should be message', () async {
      String responseJson = 'Rate limit is reached..';

      when(client.get('$basuURL/anime/1/episodes')).thenAnswer((_) async => http.Response(responseJson, 429));

      expect(api.fetchAnimeEpisodes(1), throwsException);
    });

    test('As a user, when i fetch for the episodes list and server could not find the requested website', () async {
      String responseJson = 'Failed to fetch episodes.';

      when(client.get('$basuURL/anime/1/episodes')).thenAnswer((_) async => http.Response(responseJson, 404));

      expect(api.fetchAnimeEpisodes(1), throwsException);
    });
  });

}

