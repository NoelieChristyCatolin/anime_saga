import 'package:flutter/material.dart';
import 'package:anime_saga/models/anime/anime.dart';
import 'package:anime_saga/models/anime/anime_list_data.dart';
import 'package:anime_saga/components/loading.dart';
import 'package:anime_saga/components/anime_list_widget.dart';
import 'package:anime_saga/components/rate_limit_error.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

class AnimeList extends StatefulWidget {
  static String id = "anime_list";
  final String title;

  AnimeList({this.title});

  @override
  _AnimeListState createState() => _AnimeListState();
}

class _AnimeListState extends State<AnimeList> {
  AnimeListData animeListData = AnimeListData();

  Artboard _riveArtboard;
  RiveAnimationController _controller;
  String searchKey = '';

  bool get isPlaying => _controller?.isActive ?? false;

  void _togglePlay() {
    _controller.isActive = !_controller.isActive;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    rootBundle.load('animations/teeny_tiny.riv').then(
          (data) async {
        var file = RiveFile();

        // Load the RiveFile from the binary data.
        var success = file.import(data);
        if (success) {
          // The artboard is the root of the animation and is what gets drawn
          // into the Rive widget.
          var artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(
            _controller = SimpleAnimation('idle'),
          );
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

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
              FutureBuilder<List<Anime>>(
                future: animeListData.fetchAnimes(searchKey),
                builder: (context, snapshot){
                  if (snapshot.hasError) {
                    _togglePlay();
                    return RateLimitReached(riveArtboard: _riveArtboard);
                  }
                  else {
                    return snapshot.hasData ? AnimeListWidget(animeList: snapshot.data,) : Loading();
                  }
                }
              ): Container(
                child: Text('Tell us what are you looking for?'),
              ),
            ),
          ],
        )

      ),
    );
  }
}

