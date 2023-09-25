import 'dart:convert';

PaymentRequestModel paymentRequestModelFromJson(String str) =>
    PaymentRequestModel.fromJson(json.decode(str));

String paymentRequestModelToJson(PaymentRequestModel data) =>
    json.encode(data.toJson());

class PaymentRequestModel {
  List<PaymentRequestContent> paymentRequestContent;
  Pageable? pageable;
  bool last;
  num? totalElements;
  num? totalPages;
  bool first;
  num? numberOfElements;
  num? size;
  num? number;
  Sort? sort;
  bool empty;

  PaymentRequestModel({
    this.paymentRequestContent = const <PaymentRequestContent>[],
    this.pageable,
    this.last = false,
    this.totalElements,
    this.totalPages,
    this.first = false,
    this.numberOfElements,
    this.size,
    this.number,
    this.sort,
    this.empty = false,
  });

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      PaymentRequestModel(
        paymentRequestContent:
            List<PaymentRequestContent>.from(json["content"].map((x) => PaymentRequestContent.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        first: json["first"],
        numberOfElements: json["numberOfElements"],
        size: json["size"],
        number: json["number"],
        sort: Sort.fromJson(json["sort"]),
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(paymentRequestContent.map((x) => x.toJson())),
        "pageable": pageable?.toJson(),
        "last": last,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "first": first,
        "numberOfElements": numberOfElements,
        "size": size,
        "number": number,
        "sort": sort?.toJson(),
        "empty": empty,
      };
}

class PaymentRequestContent {
  String? id;
  String? orderId;
  num? orderAmount;
  num? billedAmount;
  String? storeId;
  String? createdBy;
  DateTime? createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String? payerId;
  num? amountPaid;
  num? balanceToBePaid;
  String? payerName;
  DateTime? orderCreatedDate;
  String? storeName;
  String? orderStatus;

  PaymentRequestContent({
    this.id,
    this.orderId,
    this.orderAmount,
    this.billedAmount,
    this.storeId,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.payerId,
    this.amountPaid,
    this.balanceToBePaid,
    this.payerName,
    this.orderCreatedDate,
    this.storeName,
    this.orderStatus,
  });

  factory PaymentRequestContent.fromJson(Map<String, dynamic> json) => PaymentRequestContent(
        id: json["id"],
        orderId: json["orderId"],
        orderAmount: json["orderAmount"].toDouble(),
        billedAmount: json["billedAmount"],
        storeId: json["storeId"],
        createdBy: json["createdBy"],
        createdDate: DateTime.parse(json["createdDate"]),
        updatedBy: json["updatedBy"],
        updatedDate: json["updatedDate"],
        payerId: json["payerId"],
        amountPaid: json["amountPaid"],
        balanceToBePaid: json["balanceToBePaid"],
        payerName: json["payerName"],
        orderCreatedDate: DateTime.parse(json["orderCreatedDate"]),
        storeName: json["storeName"],
        orderStatus: json["orderStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderId": orderId,
        "orderAmount": orderAmount,
        "billedAmount": billedAmount,
        "storeId": storeId,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "updatedBy": updatedBy,
        "updatedDate": updatedDate,
        "payerId": payerId,
        "amountPaid": amountPaid,
        "balanceToBePaid": balanceToBePaid,
        "payerName": payerName,
        "orderCreatedDate": orderCreatedDate?.toIso8601String(),
        "storeName": storeName,
        "orderStatus": orderStatus,
      };
}

class Pageable {
  Sort? sort;
  num? pageSize;
  num? pageNumber;
  num? offset;
  bool unpaged;
  bool paged;

  Pageable({
    this.sort,
    this.pageSize,
    this.pageNumber,
    this.offset,
    this.unpaged = false,
    this.paged = false,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        offset: json["offset"],
        unpaged: json["unpaged"],
        paged: json["paged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort?.toJson(),
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "offset": offset,
        "unpaged": unpaged,
        "paged": paged,
      };
}

class Sort {
  bool sorted;
  bool unsorted;
  bool empty;

  Sort({
    this.sorted = false,
    this.unsorted = false,
    this.empty = false,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        unsorted: json["unsorted"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "unsorted": unsorted,
        "empty": empty,
      };
}
