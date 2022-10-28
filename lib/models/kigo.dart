class Kigo {
  Kigo(
      {required this.title,
      required this.yomi,
      required this.detail,
      required this.length,
      required this.category});

  factory Kigo.fromJson(Map<String, dynamic> json) => Kigo(
      title: json['title'].toString(),
      yomi: json['yomi'].toString(),
      detail: json['detail'].toString(),
      length: int.parse(json['length'].toString()),
      category: json['category'].toString());

  String title;
  String yomi;
  String detail;
  int length;
  String category;

  Map<String, dynamic> toJson() => {
        'title': title,
        'yomi': yomi,
        'detail': detail,
        'length': length,
        'category': category
      };
}
