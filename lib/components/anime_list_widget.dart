import 'package:anime_saga/models/anime/anime.dart';
import 'package:anime_saga/screens/episodes_list.dart';
import 'package:flutter/material.dart';

class AnimeListWidget extends StatelessWidget {
  List<Anime> animeList;
  AnimeListWidget({this.animeList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(
                animeList[index].title,
                style: TextStyle(
                    fontSize: 15
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                Navigator.pushNamed(context, EpisodesList.id, arguments: EpisodesList(anime: animeList[index]));
              },
            ),
          );
        },
        itemCount: animeList.length
    );
  }
}