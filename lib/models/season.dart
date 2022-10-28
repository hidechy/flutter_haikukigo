class Season {
  Season({
    required this.seasonEn,
    required this.seasonJp,
    required this.cnt,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        seasonEn: json['season_en'].toString(),
        seasonJp: json['season_jp'].toString(),
        cnt: int.parse(json['cnt'].toString()),
      );

  String seasonEn;
  String seasonJp;
  int cnt;

  Map<String, dynamic> toJson() => {
        'season_en': seasonEn,
        'season_jp': seasonJp,
        'cnt': cnt,
      };
}
