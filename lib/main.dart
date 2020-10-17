import 'package:anime_saga/screens/episodes_list.dart';
import 'package:anime_saga/screens/anime_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AnimeList.id,
      routes: {
        AnimeList.id : (context) => AnimeList(title: "Anime Saga"),
        EpisodesList.id : (context) => EpisodesList(),
      },
    );
  }
}
