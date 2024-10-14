import 'package:json_annotation/json_annotation.dart';
part 'products_reponse_model.g.dart';

@JsonSerializable()
class ProductsReponseModel {
  int id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductsReponseModel({
    required this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductsReponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsReponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsReponseModelToJson(this);
}

@JsonSerializable()
class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
