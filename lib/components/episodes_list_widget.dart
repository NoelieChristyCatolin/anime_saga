import 'package:anime_saga/models/episode/episode.dart';
import 'package:flutter/material.dart';

class EpisodesListWidget extends StatelessWidget {
  List<Episode> episodesList;
  EpisodesListWidget({this.episodesList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Column(
                children: [
                  Text(
                    "Episode ${episodesList[index].episodeId} :${episodesList[index].aired}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${episodesList[index].title}",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text("Filler ${episodesList[index].filler} "),
                ],
              ),
            ),
          );
        },
        itemCount: episodesList.length
    );
  }
}