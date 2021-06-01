import 'dart:convert';

List<Rating> ratingFromJson(String str) =>
    List<Rating>.from(json.decode(str).map((x) => Rating.fromJson(x)));

String ratingToJson(List<Rating> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rating {
  Rating({
    this.id,
    this.foodId,
    this.rates,
  });

  String id;
  String foodId;
  String rates;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        foodId: json["food_id"],
        rates: json["rates"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_id": foodId,
        "rates": rates,
      };
}
