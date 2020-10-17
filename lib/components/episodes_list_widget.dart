import 'package:anime_saga/models/episode/episode.dart';
import 'package:flutter/material.dart';

class EpisodesListWidget extends StatelessWidget {
  List<Episode> episodesList;
  EpisodesListWidget({this.episodesList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){
          String dateAired = formatDate(episodesList[index].aired);
          return Card(
            child: ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Episode ${episodesList[index].episodeId} : $dateAired",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${episodesList[index].title}",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text("${episodesList[index].filler ? "No Filler" : "Filler Available"} ")
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: episodesList.length
    );
  }


  String formatDate(String date){
    date.split('T')[0];
    return date.split('T')[0];
  }
}