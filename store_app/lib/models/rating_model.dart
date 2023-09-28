class RatingModel {
  final dynamic rate;
  final int count;
  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromjson(jsondata) {
    return RatingModel(
      rate: jsondata["rate"],
      count: jsondata["count"],
    );
  }
}
