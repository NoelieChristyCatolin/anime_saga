import 'package:flutter/material.dart';
import 'package:anime_saga/models/anime/anime_list_data.dart';
import 'package:anime_saga/screens/episodes_list.dart';
import 'package:anime_saga/services/anime_api.dart';
import 'package:anime_saga/components/no_results.dart';
import 'package:anime_saga/components/rate_limit_error.dart';
import 'package:anime_saga/components/anime_list_widget.dart';

class AnimeList extends StatefulWidget {
  static String id = "anime_list";
  final String title;

  AnimeList({this.title});

  @override
  _AnimeListState createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  AnimeApi api = AnimeApi();
  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration:  InputDecoration(
                      border:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(width: 2,)
                      ),
//                      hintText: 'Tell us what are you looking for?',
                      prefixIcon:  Icon(
                        Icons.search,
                        color: Colors.purple,
                      ),
                      suffixStyle:  TextStyle(color: Colors.white12),
                  ),
                  onChanged: (value){
                    setState(() {
                      searchKey = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: searchKey.isNotEmpty ?
              FutureBuilder<AnimeListData>(
                future: api.fetchAnimes(searchKey),
                builder: (context, snapshot){
                  if (snapshot.hasError) {
                    return RateLimitError();
                  }
                  else {
                    return snapshot.hasData ? AnimeListWidget(snapshot: snapshot,) : NoResults();
                  }
                }
              ) :
              Container(
                child: Text('Tell us what are you looking for?'),
              ),
            ),
          ],
        )

      ),
    );
  }
}
