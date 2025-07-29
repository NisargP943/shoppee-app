// To parse this JSON data, do
//
//     final productsResponseModel = productsResponseModelFromJson(jsonString);

import 'dart:convert';

List<ProductsResponseModel> productsResponseModelFromJson(String str) =>
    List<ProductsResponseModel>.from(
      json.decode(str).map((x) => ProductsResponseModel.fromJson(x)),
    );

String productsResponseModelToJson(List<ProductsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsResponseModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  ProductsResponseModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductsResponseModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
  };
}
