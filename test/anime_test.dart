import 'package:flutter_test/flutter_test.dart';
import 'package:anime_saga/models/anime/anime_list_data.dart';
import 'package:anime_saga/models/anime/anime.dart';
import 'package:anime_saga/services/jikan_api.dart';

class MockAnimeApi extends JikanApi{
  @override
  Future<List<Anime>> fetchAnimes(String key) {
    // TODO: implement fetchAnimes
    return Future.value([Anime(id: 1,title: key)]);
  }
}

void main() {
  var animeListData = AnimeListData();
  animeListData.api = MockAnimeApi();

  test("fetch animes", ()async{
    await animeListData.fetchAnimes("Cowboy Bebop");
    expect(animeListData.animeList.length, 1);
    expect(animeListData.animeList[0].title, "Cowboy Bebop");
    expect(animeListData.animeList[0].id, 1);
  });
}
