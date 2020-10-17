import 'package:flutter/material.dart';
import 'package:anime_saga/models/episode/episodes_list_data.dart';
import 'package:anime_saga/models/episode/episode.dart';
import 'package:anime_saga/models/anime/anime.dart';
import 'package:anime_saga/components/loading.dart';
import 'package:anime_saga/components/episodes_list_widget.dart';

class EpisodesList extends StatefulWidget {
  static String id = "episodes_list";
  final Anime anime;

  EpisodesList({this.anime});

  @override
  _EpisodesListState createState() => _EpisodesListState();
}

class _EpisodesListState extends State<EpisodesList> {
  EpisodesListData episodesListData = EpisodesListData();


  @override
  Widget build(BuildContext context) {
    final EpisodesList args = ModalRoute.of(context).settings.arguments;
    Anime anime = args.anime;
    return Scaffold(
      appBar:AppBar(
        title: Text(anime.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<Episode>>(
          future: episodesListData.fetchAnimeEpisodes(anime.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Hey!!! \nRate Limit Exceeded. Try in a while.");
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






