class Anime{
  int id;
  String title;

  Anime({this.id, this.title});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(id: json['mal_id'], title: json['title']);
  }
}