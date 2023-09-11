import 'dart:convert';

AllOrdersModel allOrdersModelFromJson(String str) => AllOrdersModel.fromJson(json.decode(str));

String allOrdersModelToJson(AllOrdersModel data) => json.encode(data.toJson());

class AllOrdersModel {
  List<AllOrders> allOrdersModelList;
  Pageable? pageable;
  bool last;
  num? totalElements;
  num? totalPages;
  num? size;
  num? number;
  Sort? sort;
  bool first;
  num? numberOfElements;
  bool empty;

  AllOrdersModel({
    this.allOrdersModelList = const <AllOrders>[],
    this.pageable,
    this.last = false,
    this.totalElements,
    this.totalPages,
    this.size,
    this.number,
    this.sort,
    this.first = false,
    this.numberOfElements,
    this.empty = false,
  });

  factory AllOrdersModel.fromJson(Map<String, dynamic> json) => AllOrdersModel(
    allOrdersModelList: List<AllOrders>.from(json["content"].map((x) => AllOrders.fromJson(x))),
    pageable: Pageable.fromJson(json["pageable"]),
    last: json["last"],
    totalElements: json["totalElements"],
    totalPages: json["totalPages"],
    size: json["size"],
    number: json["number"],
    sort: Sort.fromJson(json["sort"]),
    first: json["first"],
    numberOfElements: json["numberOfElements"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(allOrdersModelList.map((x) => x.toJson())),
    "pageable": pageable?.toJson(),
    "last": last,
    "totalElements": totalElements,
    "totalPages": totalPages,
    "size": size,
    "number": number,
    "sort": sort?.toJson(),
    "first": first,
    "numberOfElements": numberOfElements,
    "empty": empty,
  };
}

class AllOrders {
  String? id;
  dynamic usedRewards;
  dynamic usedCashBack;
  String? createdAt;
  String? userId;
  String? userName;
  String? mobileNumber;
  num? orderTotalValue;
  dynamic paidAmount;
  dynamic orderValue;
  String? storeId;
  List<OrderItem> items;
  num? deliveryCharges;
  num? serviceCharges;
  dynamic tax;
  dynamic couponInfo;
  dynamic discounts;
  String? paymentMode;
  Map<String, String> pickupAddress;
  Map<String, String> deliveryAddress;
  String? deliveryDate;
  String? slot;
  String? isExpressDelivery;
  dynamic riderId;
  dynamic orderAssignedStatus;
  String? deliveryStatus;
  String? riderOrderAcceptStatus;
  dynamic isPickedFromStore;
  dynamic atLocation;
  String? orderEventStatus;
  dynamic orderStatus;
  String? orderEventId;
  String? storeName;
  String? storeImageUrl;
  dynamic orderCreatedDate;
  dynamic orderUpdatedDate;
  dynamic orderAssignedDate;
  dynamic orderDelivaryDate;
  bool prescVerified;
  bool prescAdded;
  bool prescIsExistingCustomer;
  dynamic rewardPoints;
  dynamic validTillDate;
  dynamic prescImages;
  bool consultDoctor;
  String? paymentTransactionId;
  dynamic categoryId;
  dynamic categoryName;
  dynamic subCategoryId;
  dynamic subCategoryName;
  num? orderAcceptedValue;
  dynamic orderRefundValue;
  dynamic refundStatus;
  dynamic refundDate;
  dynamic fcmToken;
  dynamic riderPhoneNumber;
  dynamic riderStatusMessage;
  dynamic riderImgUrl;
  dynamic riderName;
  dynamic serviceChargesPercentage;
  dynamic specialInstruction;
  dynamic anySpecialInstruction;
  dynamic orderValueAfterDiscount;
  dynamic totalGstAmount;
  dynamic totalCgstAmount;
  dynamic totalSgstAmount;
  dynamic discountAmount;

  AllOrders({
    this.id,
    this.usedRewards,
    this.usedCashBack,
    this.createdAt,
    this.userId,
    this.userName,
    this.mobileNumber,
    this.orderTotalValue,
    this.paidAmount,
    this.orderValue,
    this.storeId,
    this.items = const <OrderItem>[],
    this.deliveryCharges,
    this.serviceCharges,
    this.tax,
    this.couponInfo,
    this.discounts,
    this.paymentMode,
    this.pickupAddress = const {},
    this.deliveryAddress = const {},
    this.deliveryDate,
    this.slot,
    this.isExpressDelivery,
    this.riderId,
    this.orderAssignedStatus,
    this.deliveryStatus,
    this.riderOrderAcceptStatus,
    this.isPickedFromStore,
    this.atLocation,
    this.orderEventStatus,
    this.orderStatus,
    this.orderEventId,
    this.storeName,
    this.storeImageUrl,
    this.orderCreatedDate,
    this.orderUpdatedDate,
    this.orderAssignedDate,
    this.orderDelivaryDate,
    this.prescVerified = false,
    this.prescAdded = false,
    this.prescIsExistingCustomer = false,
    this.rewardPoints,
    this.validTillDate,
    this.prescImages,
    this.consultDoctor = false,
    this.paymentTransactionId,
    this.categoryId,
    this.categoryName,
    this.subCategoryId,
    this.subCategoryName,
    this.orderAcceptedValue,
    this.orderRefundValue,
    this.refundStatus,
    this.refundDate,
    this.fcmToken,
    this.riderPhoneNumber,
    this.riderStatusMessage,
    this.riderImgUrl,
    this.riderName,
    this.serviceChargesPercentage,
    this.specialInstruction,
    this.anySpecialInstruction,
    this.orderValueAfterDiscount,
    this.totalGstAmount,
    this.totalCgstAmount,
    this.totalSgstAmount,
    this.discountAmount,
  });

  factory AllOrders.fromJson(Map<String, dynamic> json) => AllOrders(
    id: json["id"],
    usedRewards: json["usedRewards"],
    usedCashBack: json["usedCashBack"],
    createdAt: json["createdAt"],
    userId: json["userId"],
    userName: json["userName"],
    mobileNumber: json["mobileNumber"],
    orderTotalValue: json["orderTotalValue"],
    paidAmount: json["paidAmount"],
    orderValue: json["orderValue"],
    storeId: json["storeId"],
    items: List<OrderItem>.from(json["items"].map((x) => OrderItem.fromJson(x))),
    deliveryCharges: json["deliveryCharges"],
    serviceCharges: json["serviceCharges"],
    tax: json["tax"],
    couponInfo: json["couponInfo"],
    discounts: json["discounts"],
    paymentMode: json["paymentMode"],
    pickupAddress: Map.from(json["pickupAddress"]).map((k, v) => MapEntry<String, String>(k, (v ?? ''))),
    deliveryAddress: Map.from(json["deliveryAddress"]).map((k, v) => MapEntry<String, String>(k, (v ?? ''))),
    deliveryDate: json["deliveryDate"],
    slot: json["slot"],
    isExpressDelivery: json["isExpressDelivery"],
    riderId: json["riderId"],
    orderAssignedStatus: json["orderAssignedStatus"],
    deliveryStatus: json["deliveryStatus"],
    riderOrderAcceptStatus: json["riderOrderAcceptStatus"],
    isPickedFromStore: json["isPickedfromStore"],
    atLocation: json["atLocation"],
    orderEventStatus: json["orderEventStatus"],
    orderStatus: json["orderStatus"],
    orderEventId: json["orderEventId"],
    storeName: json["storeName"],
    storeImageUrl: json["storeImageURL"],
    orderCreatedDate: json["orderCreatedDate"],
    orderUpdatedDate: json["orderUpdatedDate"],
    orderAssignedDate: json["orderAssignedDate"],
    orderDelivaryDate: json["orderDelivaryDate"],
    prescVerified: json["prescVerified"],
    prescAdded: json["prescAdded"],
    prescIsExistingCustomer: json["prescIsExistingCutomer"],
    rewardPoints: json["rewardPoints"],
    validTillDate: json["validTillDate"],
    prescImages: json["prescImgs"],
    consultDoctor: json["consultDoctor"],
    paymentTransactionId: json["paymentTrasactionId"],
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
    subCategoryId: json["subCategoryId"],
    subCategoryName: json["subCategoryName"],
    orderAcceptedValue: json["orderAcceptedValue"],
    orderRefundValue: json["orderRefundValue"],
    refundStatus: json["refundStatus"],
    refundDate: json["refundDate"],
    fcmToken: json["fcmToken"],
    riderPhoneNumber: json["riderPhoneNumber"],
    riderStatusMessage: json["riderStatusMessage"],
    riderImgUrl: json["riderImgURL"],
    riderName: json["riderName"],
    serviceChargesPercentage: json["serviceChargesPercentage"],
    specialInstruction: json["specialInstruction"],
    anySpecialInstruction: json["anySpecialInstruction"],
    orderValueAfterDiscount: json["orderValueAfterDiscount"],
    totalGstAmount: json["totalGstAmount"],
    totalCgstAmount: json["totalCgstAmount"],
    totalSgstAmount: json["totalSgstAmount"],
    discountAmount: json["discountAmount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "usedRewards": usedRewards,
    "usedCashBack": usedCashBack,
    "createdAt": createdAt,
    "userId": userId,
    "userName": userName,
    "mobileNumber": mobileNumber,
    "orderTotalValue": orderTotalValue,
    "paidAmount": paidAmount,
    "orderValue": orderValue,
    "storeId": storeId,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "deliveryCharges": deliveryCharges,
    "serviceCharges": serviceCharges,
    "tax": tax,
    "couponInfo": couponInfo,
    "discounts": discounts,
    "paymentMode": paymentMode,
    "pickupAddress": Map.from(pickupAddress).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "deliveryAddress": Map.from(deliveryAddress).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "deliveryDate": deliveryDate,
    "slot": slot,
    "isExpressDelivery": isExpressDelivery,
    "riderId": riderId,
    "orderAssignedStatus": orderAssignedStatus,
    "deliveryStatus": deliveryStatus,
    "riderOrderAcceptStatus": riderOrderAcceptStatus,
    "isPickedfromStore": isPickedFromStore,
    "atLocation": atLocation,
    "orderEventStatus": orderEventStatus,
    "orderStatus": orderStatus,
    "orderEventId": orderEventId,
    "storeName": storeName,
    "storeImageURL": storeImageUrl,
    "orderCreatedDate": orderCreatedDate,
    "orderUpdatedDate": orderUpdatedDate,
    "orderAssignedDate": orderAssignedDate,
    "orderDelivaryDate": orderDelivaryDate,
    "prescVerified": prescVerified,
    "prescAdded": prescAdded,
    "prescIsExistingCutomer": prescIsExistingCustomer,
    "rewardPoints": rewardPoints,
    "validTillDate": validTillDate,
    "prescImgs": prescImages,
    "consultDoctor": consultDoctor,
    "paymentTrasactionId": paymentTransactionId,
    "categoryId": categoryId,
    "categoryName": categoryName,
    "subCategoryId": subCategoryId,
    "subCategoryName": subCategoryName,
    "orderAcceptedValue": orderAcceptedValue,
    "orderRefundValue": orderRefundValue,
    "refundStatus": refundStatus,
    "refundDate": refundDate,
    "fcmToken": fcmToken,
    "riderPhoneNumber": riderPhoneNumber,
    "riderStatusMessage": riderStatusMessage,
    "riderImgURL": riderImgUrl,
    "riderName": riderName,
    "serviceChargesPercentage": serviceChargesPercentage,
    "specialInstruction": specialInstruction,
    "anySpecialInstruction": anySpecialInstruction,
    "orderValueAfterDiscount": orderValueAfterDiscount,
    "totalGstAmount": totalGstAmount,
    "totalCgstAmount": totalCgstAmount,
    "totalSgstAmount": totalSgstAmount,
    "discountAmount": discountAmount,
  };
}

class OrderItem {
  String? productId;
  String? productName;
  num? price;
  num? mrp;
  num? quantity;
  num? freeQuantity;
  num? confirmQuantity;
  num? finalQuantity;
  dynamic finalPtr;
  num? discountAmount;
  String? skuId;
  String? skuCode;
  num? totalPrice;
  num? discountPrice;
  String? itemUrl;
  bool presRquried;
  dynamic measure;
  String? status;
  num? gst;
  num? cgst;
  num? sgst;
  String? gstPercent;
  String? cgstPercent;
  String? sgstPercent;
  String? schemeName;
  String? manufacturer;
  String? batchNumber;
  String? hsn;
  String? mfdDate;
  String? expDate;
  String? packingType;
  num? lineAmount;

  OrderItem({
    this.productId,
    this.productName,
    this.price,
    this.mrp,
    this.quantity,
    this.freeQuantity,
    this.confirmQuantity,
    this.finalQuantity,
    this.finalPtr,
    this.discountAmount,
    this.skuId,
    this.skuCode,
    this.totalPrice,
    this.discountPrice,
    this.itemUrl,
    this.presRquried = false,
    this.measure,
    this.status,
    this.gst,
    this.cgst,
    this.sgst,
    this.gstPercent,
    this.cgstPercent,
    this.sgstPercent,
    this.schemeName,
    this.manufacturer,
    this.batchNumber,
    this.hsn,
    this.mfdDate,
    this.expDate,
    this.packingType,
    this.lineAmount,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    productId: json["productId"],
    productName: json["productName"],
    price: json["price"],
    mrp: json["mrp"],
    quantity: json["quantity"],
    freeQuantity: json["freeQuantity"],
    confirmQuantity: json["confirmQuantity"],
    finalQuantity: json["finalQuantity"],
    finalPtr: json["finalPtr"],
    discountAmount: json["discountAmount"],
    skuId: json["skuId"],
    skuCode: json["skuCode"],
    totalPrice: json["totalPrice"],
    discountPrice: json["discountPrice"],
    itemUrl: json["itemURL"],
    presRquried: json["presRquried"],
    measure: json["measure"],
    status: json["status"],
    gst: json["gst"],
    cgst: json["cgst"],
    sgst: json["sgst"],
    gstPercent: json["gstPercent"],
    cgstPercent: json["cgstPercent"],
    sgstPercent: json["sgstPercent"],
    schemeName: json["schemeName"],
    manufacturer: json["manufracuter"],
    batchNumber: json["batchNumer"],
    hsn: json["hsn"],
    mfdDate: json["mfdate"],
    expDate: json["expdate"],
    packingType: json["packingType"],
    lineAmount: json["lineAmount"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productName": productName,
    "price": price,
    "mrp": mrp,
    "quantity": quantity,
    "freeQuantity": freeQuantity,
    "confirmQuantity": confirmQuantity,
    "finalQuantity": finalQuantity,
    "finalPtr": finalPtr,
    "discountAmount": discountAmount,
    "skuId": skuId,
    "skuCode": skuCode,
    "totalPrice": totalPrice,
    "discountPrice": discountPrice,
    "itemURL": itemUrl,
    "presRquried": presRquried,
    "measure": measure,
    "status": status,
    "gst": gst,
    "cgst": cgst,
    "sgst": sgst,
    "gstPercent": gstPercent,
    "cgstPercent": cgstPercent,
    "sgstPercent": sgstPercent,
    "schemeName": schemeName,
    "manufracuter": manufacturer,
    "batchNumer": batchNumber,
    "hsn": hsn,
    "mfdate": mfdDate,
    "expdate": expDate,
    "packingType": packingType,
    "lineAmount": lineAmount,
  };
}

class Pageable {
  Sort? sort;
  num? offset;
  num? pageNumber;
  num? pageSize;
  bool unPaged;
  bool paged;

  Pageable({
    this.sort,
    this.offset,
    this.pageNumber,
    this.pageSize,
    this.unPaged = false,
    this.paged = false,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
    sort: Sort.fromJson(json["sort"]),
    offset: json["offset"],
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    unPaged: json["unpaged"],
    paged: json["paged"],
  );

  Map<String, dynamic> toJson() => {
    "sort": sort?.toJson(),
    "offset": offset,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "unpaged": unPaged,
    "paged": paged,
  };
}

class Sort {
  bool empty;
  bool sorted;
  bool unsorted;

  Sort({
    this.empty = false,
    this.sorted = false,
    this.unsorted = false,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    empty: json["empty"],
    sorted: json["sorted"],
    unsorted: json["unsorted"],
  );

  Map<String, dynamic> toJson() => {
    "empty": empty,
    "sorted": sorted,
    "unsorted": unsorted,
  };
}
