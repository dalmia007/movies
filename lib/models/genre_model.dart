class Genre {
  int id;
  String name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> jsonData) {
    return Genre(
      id: jsonData['id'],
      name: jsonData['name'],
    );
  }

  // static List<Genre> fromJsonArray(List jsonArray) {
  //   return jsonArray?.map((item) {
  //         return Genre.fromJson(item);
  //       })?.toList() ??
  //       <Genre>[];
  // }
}
