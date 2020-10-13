import 'package:flutter/material.dart';
import 'package:anime_saga/services/anime_api.dart';
import 'package:anime_saga/models/episode/episodes_list_data.dart';
import 'package:anime_saga/models/anime/anime.dart';

class EpisodesList extends StatefulWidget {
  static String id = "episodes_list";
  Anime anime = Anime();

  EpisodesList({this.anime});

  @override
  _EpisodesListState createState() => _EpisodesListState();
}

class _EpisodesListState extends State<EpisodesList> {
  final AnimeApi api = AnimeApi();

  @override
  Widget build(BuildContext context) {
    print("context");
    final EpisodesList args = ModalRoute.of(context).settings.arguments;
    widget.anime = args.anime;
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.anime.title),
      ),
      body: FutureBuilder<EpisodesListData>(
          future: api.fetchAnimeEpisodes(widget.anime.id),
          builder: (context, snapshot){
                  return snapshot.hasData ? ListView.builder(
                      itemBuilder: (context, index){
                        return Card(
                          child: ListTile(
                            title: Text(
                              snapshot.data.episodesList[index].title,
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (_){
                                    return AlertDialog(
                                      actions: <Widget> [
                                        FlatButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"))
                                      ],
                                      title: Text("Episode ${snapshot.data.episodesList[index].episodeId} :${snapshot.data.episodesList[index].title}"),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Text("Aired Last ${snapshot.data.episodesList[index].aired} "),
                                            Text("Filler ${snapshot.data.episodesList[index].filler} "),
                                          ],
                                        ),
                                      ),

                                    );
                                  },
                                );
                              }
                          ),
                        );
                      },
                      itemCount: snapshot.data.episodesList.length) : Container();
          }
      ),
    );
  }
}
