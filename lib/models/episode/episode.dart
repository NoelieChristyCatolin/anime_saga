class Episode{
  int episodeId;
  String title;
  String aired;
  bool filler;

  Episode({this.episodeId, this.title, this.aired, this.filler});

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(episodeId: json['episode_id'], title: json['title'],aired:  json['aired'], filler:  json['filler']);
  }
}