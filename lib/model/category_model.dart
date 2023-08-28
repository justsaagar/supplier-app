// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  String? categoryId;
  String? categoryName;
  String? imageId;
  String? isEnabled;
  String? isActive;
  DateTime? updatedAt;
  String? imgBgColor;
  String? imgFrontColor;
  String? labelColor;
  String? medicalCategory;
  String? cardShadowColor;
  String? applicationName;
  String? menuLabelColor;

  CategoryModel({
    this.categoryId,
    this.categoryName,
    this.imageId,
    this.isEnabled,
    this.isActive,
    this.updatedAt,
    this.imgBgColor,
    this.imgFrontColor,
    this.labelColor,
    this.medicalCategory,
    this.cardShadowColor,
    this.applicationName,
    this.menuLabelColor,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        imageId: json["imageId"],
        isEnabled: json["isEnabled"],
        isActive: json["isActive"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        imgBgColor: json["imgBgColor"],
        imgFrontColor: json["imgFrontColor"],
        labelColor: json["labelColor"],
        medicalCategory: json["medicalCategory"],
        cardShadowColor: json["cardShadowColor"],
        applicationName: json["applicationName"],
        menuLabelColor: json["menulableColor"],
      );

  Map<String, dynamic> toJson() =>
      {
        "categoryId": categoryId,
        "categoryName": categoryName,
        "imageId": imageId,
        "isEnabled": isEnabled,
        "isActive": isActive,
        "updatedAt": updatedAt?.toIso8601String(),
        "imgBgColor": imgBgColor,
        "imgFrontColor": imgFrontColor,
        "labelColor": labelColor,
        "medicalCategory": medicalCategory,
        "cardShadowColor": cardShadowColor,
        "applicationName": applicationName,
        "menulableColor": menuLabelColor,
      };
}
