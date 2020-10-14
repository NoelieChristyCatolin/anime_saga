import 'package:flutter/material.dart';

class EpisodesListWidget extends StatelessWidget {
  AsyncSnapshot snapshot;
  EpisodesListWidget({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Column(
                children: [
                  Text(
                    "Episode ${snapshot.data.episodesList[index].episodeId} :${snapshot.data.episodesList[index].aired}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${snapshot.data.episodesList[index].title}",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text("Filler ${snapshot.data.episodesList[index].filler} "),
                ],
              ),
            ),
          );
        },
        itemCount: snapshot.data.episodesList.length
    );
  }
}