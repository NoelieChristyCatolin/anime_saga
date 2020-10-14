import 'package:flutter/material.dart';
import 'package:anime_saga/screens/episodes_list.dart';

class AnimeListWidget extends StatelessWidget {
  AsyncSnapshot snapshot;
  AnimeListWidget({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(
                snapshot.data.animeList[index].title,
                style: TextStyle(
                    fontSize: 15
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                Navigator.pushNamed(context, EpisodesList.id, arguments: EpisodesList(anime: snapshot.data.animeList[index]));
              },
            ),
          );
        },
        itemCount: snapshot.data.animeList.length
    );
  }
}