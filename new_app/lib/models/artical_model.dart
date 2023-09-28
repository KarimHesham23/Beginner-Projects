class ArticalModel {
  final String? title;
  final String? subTitle;
  final String? image;
  ArticalModel(
      {required this.title, required this.subTitle, required this.image});
  factory ArticalModel.fromjson(jsonData) {
    return ArticalModel(
        title: jsonData["title"],
        subTitle: jsonData["description"],
        image: jsonData["urlToImage"]);
  }
}
