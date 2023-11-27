import 'dart:convert';

List<InventoryStockModel> emptyFromJson(String str) => List<InventoryStockModel>.from(json.decode(str).map((x) => InventoryStockModel.fromJson(x)));

String emptyToJson(List<InventoryStockModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryStockModel {
  String? productName;
  String? skuCode;
  String? stockStatus;
  num? price;
  num? mrp;
  num? ptr;
  num? quantity;

  InventoryStockModel({
    this.productName,
    this.skuCode,
    this.stockStatus,
    this.price,
    this.mrp,
    this.ptr,
    this.quantity,
  });

  factory InventoryStockModel.fromJson(Map<String, dynamic> json) => InventoryStockModel(
    productName: json["productName"],
    skuCode: json["skuCode"],
    stockStatus: json["stockStaus"],
    price: json["price"],
    mrp: json["mrp"],
    ptr: json["ptr"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "productName": productName,
    "skuCode": skuCode,
    "stockStaus": stockStatus,
    "price": price,
    "mrp": mrp,
    "ptr": ptr,
    "quantity": quantity,
  };
}
