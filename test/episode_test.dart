import 'package:flutter_test/flutter_test.dart';
import 'package:anime_saga/models/episode/episodes_list_data.dart';
import 'package:anime_saga/models/episode/episode.dart';
import 'package:anime_saga/services/jikan_api.dart';

class MockAnimeApi extends JikanApi{
@override
  Future<List<Episode>> fetchAnimeEpisodes(int id) {
    return Future.value([
      Episode(episodeId: 1,title: "Asteroid Blues",aired: "1998-10-24T00:00:00+00:00", filler: false),
      Episode(episodeId: 2,title: "Nora Inu no Strut",aired: "1998-04-03T00:00:00+00:00", filler: false),
    ]);
  }
}

void main() {
  var episodesListData = EpisodesListData();
  episodesListData.api = MockAnimeApi();

  test("fetch animes", ()async{
    await episodesListData.fetchAnimeEpisodes(1);
    expect(episodesListData.episodesList.length, 2);
    expect(episodesListData.episodesList[0].title, "Asteroid Blues");
    expect(episodesListData.episodesList[0].episodeId, 1);
    expect(episodesListData.episodesList[0].aired, "1998-10-24T00:00:00+00:00");
  });
}
