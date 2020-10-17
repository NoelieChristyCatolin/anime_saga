import 'package:flutter/material.dart';
import 'package:anime_saga/services/jikan_api.dart';
import 'package:anime_saga/models/episode/episodes_list_data.dart';
import 'package:anime_saga/models/episode/episode.dart';
import 'package:anime_saga/models/anime/anime.dart';
import 'package:anime_saga/components/rate_limit_error.dart';
import 'package:anime_saga/components/loading.dart';
import 'package:anime_saga/components/episodes_list_widget.dart';

class EpisodesList extends StatefulWidget {
  static String id = "episodes_list";
  Anime anime = Anime();

  EpisodesList({this.anime});

  @override
  _EpisodesListState createState() => _EpisodesListState();
}

class _EpisodesListState extends State<EpisodesList> {
  EpisodesListData episodesListData = EpisodesListData();

  @override
  Widget build(BuildContext context) {
    final EpisodesList args = ModalRoute.of(context).settings.arguments;
    widget.anime = args.anime;
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.anime.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<Episode>>(
          future: episodesListData.fetchAnimeEpisodes(widget.anime.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return RateLimitError();
            }
            else {
              return snapshot.hasData ? EpisodesListWidget(episodesList: snapshot.data,) : Loading();
            }
          }
        ),
      ),
    );
  }
}






