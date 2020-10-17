import 'package:flutter/material.dart';
import 'package:anime_saga/models/episode/episode.dart';

class EpisodesListWidget extends StatefulWidget {
  final List<Episode> episodesList;
  EpisodesListWidget({this.episodesList});

  @override
  _EpisodesListWidgetState createState() => _EpisodesListWidgetState();
}

class _EpisodesListWidgetState extends State<EpisodesListWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.episodesList.isNotEmpty ? ListView.builder(
        itemBuilder: (context, index){
          String dateAired = formatDate(widget.episodesList[index].aired);
          return Card(
            child: ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Episode ${widget.episodesList[index].episodeId} : $dateAired",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${widget.episodesList[index].title}",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text("${widget.episodesList[index].filler ? "No Filler" : "Filler Available"} ")
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: widget.episodesList.length
    ): Image.asset(
        "images/NoMatches.gif"
    );
  }

  String formatDate(String date){
    return date.split('T')[0];
  }
}