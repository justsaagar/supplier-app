import 'dart:convert';

PaymentDetailsModel paymentDetailsModelFromJson(String str) => PaymentDetailsModel.fromJson(json.decode(str));

String paymentDetailsModelToJson(PaymentDetailsModel data) => json.encode(data.toJson());

class PaymentDetailsModel {
  String? orderId;
  num? orderAmount;
  DateTime? orderDate;
  num? paidAmount;
  num? billedAmount;
  num? balanceTobePaid;
  String? userName;
  String? userId;
  String? orderStatus;
  bool fullyPaid;
  List<PaymentInfo> paymentInfo;

  PaymentDetailsModel({
    this.orderId,
    this.orderAmount,
    this.orderDate,
    this.paidAmount,
    this.billedAmount,
    this.balanceTobePaid,
    this.userName,
    this.userId,
    this.orderStatus,
    this.fullyPaid = false,
    this.paymentInfo = const <PaymentInfo>[],
  });

  factory PaymentDetailsModel.fromJson(Map<String, dynamic> json) =>
      PaymentDetailsModel(
        orderId: json["orderId"],
        orderAmount: json["orderAmount"].toDouble(),
        orderDate: DateTime.parse(json["orderDate"]),
        paidAmount: json["paidAmount"],
        billedAmount: json["billedAmount"],
        balanceTobePaid: json["balanceTobePaid"],
        userName: json["userName"],
        userId: json["userId"],
        orderStatus: json["orderStatus"],
        fullyPaid: json["fullyPaid"] != null
            ? json["fullyPaid"].toString().toLowerCase() == 'y'
            : false,
        paymentInfo: List<PaymentInfo>.from(
            json["paymentInfo"].map((x) => PaymentInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "orderAmount": orderAmount,
        "orderDate": orderDate?.toIso8601String(),
        "paidAmount": paidAmount,
        "billedAmount": billedAmount,
        "balanceTobePaid": balanceTobePaid,
        "userName": userName,
        "userId": userId,
        "orderStatus": orderStatus,
        "fullyPaid": fullyPaid,
        "paymentInfo": List<dynamic>.from(paymentInfo.map((x) => x.toJson())),
      };
}

class PaymentInfo {
  String? paymentId;
  DateTime? paidDate;
  num? paidAmount;
  String? trasactionStatus;
  String? paymentMode;
  String? paymentType;

  PaymentInfo({
    this.paymentId,
    this.paidDate,
    this.paidAmount,
    this.trasactionStatus,
    this.paymentMode,
    this.paymentType,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => PaymentInfo(
        paymentId: json["paymentId"],
        paidDate: json["paidDate"] == null ? DateTime.now() : DateTime.parse(json["paidDate"]),
        paidAmount: json["paidAmount"],
        trasactionStatus: json["trasactionStatus"],
        paymentMode: json["paymentMode"],
        paymentType: json["paymentType"],
      );

  Map<String, dynamic> toJson() => {
        "paymentId": paymentId,
        "paidDate": paidDate?.toIso8601String(),
        "paidAmount": paidAmount,
        "trasactionStatus": trasactionStatus,
        "paymentMode": paymentMode,
        "paymentType": paymentType,
      };
}
