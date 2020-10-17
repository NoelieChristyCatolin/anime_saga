import 'package:flutter/material.dart';
import 'package:anime_saga/models/anime/anime.dart';
import 'package:anime_saga/screens/episodes_list.dart';

class AnimeListWidget extends StatefulWidget {
  final List<Anime> animeList;
  AnimeListWidget({this.animeList});

  @override
  _AnimeListWidgetState createState() => _AnimeListWidgetState();
}

class _AnimeListWidgetState extends State<AnimeListWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.animeList.isNotEmpty ? ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(
                widget.animeList[index].title,
                style: TextStyle(
                    fontSize: 15
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                Navigator.pushNamed(context, EpisodesList.id, arguments: EpisodesList(anime: widget.animeList[index]));
              },
            ),
          );
        },
        itemCount: widget.animeList.length
    ) : Image.asset(
          "images/NoMatches.gif"
        )
    ;
  }
}