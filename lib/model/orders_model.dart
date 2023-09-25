import 'dart:convert';

OrdersModel ordersModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  List<OrdersContent> ordersContent;
  Pageable? pageable;
  num? totalPages;
  num? totalElements;
  bool last;
  num? numberOfElements;
  num? size;
  num? number;
  bool first;
  Sort? sort;
  bool empty;

  OrdersModel({
    this.ordersContent = const <OrdersContent>[],
    this.pageable,
    this.totalPages,
    this.totalElements,
    this.last = false,
    this.numberOfElements,
    this.size,
    this.number,
    this.first = false,
    this.sort,
    this.empty = false,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    ordersContent: List<OrdersContent>.from(json["content"].map((x) => OrdersContent.fromJson(x))),
    pageable: Pageable.fromJson(json["pageable"]),
    totalPages: json["totalPages"],
    totalElements: json["totalElements"],
    last: json["last"],
    numberOfElements: json["numberOfElements"],
    size: json["size"],
    number: json["number"],
    first: json["first"],
    sort: Sort.fromJson(json["sort"]),
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(ordersContent.map((x) => x.toJson())),
    "pageable": pageable?.toJson(),
    "totalPages": totalPages,
    "totalElements": totalElements,
    "last": last,
    "numberOfElements": numberOfElements,
    "size": size,
    "number": number,
    "first": first,
    "sort": sort?.toJson(),
    "empty": empty,
  };
}

class OrdersContent {
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
  Address? pickupAddress;
  Address? deliveryAddress;
  String? deliveryDate;
  String? slot;
  String? isExpressDelivery;
  dynamic riderId;
  dynamic orderAssignedStatus;
  String? deliveryStatus;
  String? riderOrderAcceptStatus;
  dynamic isPickedfromStore;
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
  bool prescIsExistingCutomer;
  dynamic rewardPoints;
  dynamic validTillDate;
  dynamic prescImgs;
  bool consultDoctor;
  String? paymentTrasactionId;
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

  OrdersContent({
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
    this.pickupAddress,
    this.deliveryAddress,
    this.deliveryDate,
    this.slot,
    this.isExpressDelivery,
    this.riderId,
    this.orderAssignedStatus,
    this.deliveryStatus,
    this.riderOrderAcceptStatus,
    this.isPickedfromStore,
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
    this.prescIsExistingCutomer = false,
    this.rewardPoints,
    this.validTillDate,
    this.prescImgs,
    this.consultDoctor = false,
    this.paymentTrasactionId,
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

  factory OrdersContent.fromJson(Map<String, dynamic> json) => OrdersContent(
    id: json["id"],
    usedRewards: json["usedRewards"],
    usedCashBack: json["usedCashBack"],
    createdAt: json["createdAt"],
    userId: json["userId"],
    userName: json["userName"],
    mobileNumber: json["mobileNumber"],
    orderTotalValue: json["orderTotalValue"].toDouble(),
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
    pickupAddress: Address.fromJson(json["pickupAddress"]),
    deliveryAddress: Address.fromJson(json["deliveryAddress"]),
    deliveryDate: json["deliveryDate"],
    slot: json["slot"],
    isExpressDelivery: json["isExpressDelivery"],
    riderId: json["riderId"],
    orderAssignedStatus: json["orderAssignedStatus"],
    deliveryStatus: json["deliveryStatus"],
    riderOrderAcceptStatus: json["riderOrderAcceptStatus"],
    isPickedfromStore: json["isPickedfromStore"],
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
    prescIsExistingCutomer: json["prescIsExistingCutomer"],
    rewardPoints: json["rewardPoints"],
    validTillDate: json["validTillDate"],
    prescImgs: json["prescImgs"],
    consultDoctor: json["consultDoctor"],
    paymentTrasactionId: json["paymentTrasactionId"],
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
    "pickupAddress": pickupAddress?.toJson(),
    "deliveryAddress": deliveryAddress?.toJson(),
    "deliveryDate": deliveryDate,
    "slot": slot,
    "isExpressDelivery": isExpressDelivery,
    "riderId": riderId,
    "orderAssignedStatus": orderAssignedStatus,
    "deliveryStatus": deliveryStatus,
    "riderOrderAcceptStatus": riderOrderAcceptStatus,
    "isPickedfromStore": isPickedfromStore,
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
    "prescIsExistingCutomer": prescIsExistingCutomer,
    "rewardPoints": rewardPoints,
    "validTillDate": validTillDate,
    "prescImgs": prescImgs,
    "consultDoctor": consultDoctor,
    "paymentTrasactionId": paymentTrasactionId,
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

class Address {
  String? mobileNumber;
  String? addressType;
  dynamic addresslineMobileOne;
  dynamic addresslineMobileTwo;
  dynamic alterNateMobileNumber;
  dynamic emailId;
  dynamic pinCode;
  String? addressLine1;
  dynamic addressLine2;
  dynamic landMark;
  dynamic city;
  dynamic region;
  dynamic state;
  String? latitude;
  String? longitude;
  GeoLocation? geoLocation;

  Address({
    this.mobileNumber,
    this.addressType,
    this.addresslineMobileOne,
    this.addresslineMobileTwo,
    this.alterNateMobileNumber,
    this.emailId,
    this.pinCode,
    this.addressLine1,
    this.addressLine2,
    this.landMark,
    this.city,
    this.region,
    this.state,
    this.latitude,
    this.longitude,
    this.geoLocation,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    mobileNumber: json["mobileNumber"],
    addressType: json["addressType"],
    addresslineMobileOne: json["addresslineMobileOne"],
    addresslineMobileTwo: json["addresslineMobileTwo"],
    alterNateMobileNumber: json["alterNateMobileNumber"],
    emailId: json["emailId"],
    pinCode: json["pinCode"],
    addressLine1: json["addressLine1"],
    addressLine2: json["addressLine2"],
    landMark: json["landMark"],
    city: json["city"],
    region: json["region"],
    state: json["state"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    geoLocation: json["geoLocation"] == null ? null : GeoLocation.fromJson(json["geoLocation"]),
  );

  Map<String, dynamic> toJson() => {
    "mobileNumber": mobileNumber,
    "addressType": addressType,
    "addresslineMobileOne": addresslineMobileOne,
    "addresslineMobileTwo": addresslineMobileTwo,
    "alterNateMobileNumber": alterNateMobileNumber,
    "emailId": emailId,
    "pinCode": pinCode,
    "addressLine1": addressLine1,
    "addressLine2": addressLine2,
    "landMark": landMark,
    "city": city,
    "region": region,
    "state": state,
    "latitude": latitude,
    "longitude": longitude,
    "geoLocation": geoLocation?.toJson(),
  };
}

class GeoLocation {
  num? x;
  num? y;
  List<num> coordinates;
  String? type;

  GeoLocation({
    this.x,
    this.y,
    this.coordinates = const<num>[],
    this.type,
  });

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
    x: json["x"].toDouble(),
    y: json["y"].toDouble(),
    coordinates: List<num>.from(json["coordinates"].map((x) => x.toDouble())),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    "type": type,
  };
}

class OrderItem {
  String? productId;
  String? productName;
  num? price;
  dynamic mrp;
  num? quantity;
  dynamic freeQuantity;
  dynamic confirmQuantity;
  dynamic finalQuantity;
  dynamic finalPtr;
  dynamic discountAmount;
  String? skuId;
  String? skuCode;
  num? totalPrice;
  dynamic discountPrice;
  String? itemUrl;
  bool presRequired;
  dynamic measure;
  String? status;
  dynamic gst;
  dynamic cgst;
  dynamic sgst;
  dynamic gstPercent;
  dynamic cgstPercent;
  dynamic sgstPercent;
  dynamic schemeName;
  dynamic manufracuter;
  dynamic batchNumer;
  dynamic hsn;
  dynamic mfdate;
  dynamic expdate;
  dynamic packingType;
  dynamic lineAmount;

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
    this.presRequired = false,
    this.measure,
    this.status,
    this.gst,
    this.cgst,
    this.sgst,
    this.gstPercent,
    this.cgstPercent,
    this.sgstPercent,
    this.schemeName,
    this.manufracuter,
    this.batchNumer,
    this.hsn,
    this.mfdate,
    this.expdate,
    this.packingType,
    this.lineAmount,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    productId: json["productId"],
    productName: json["productName"],
    price: json["price"].toDouble(),
    mrp: json["mrp"],
    quantity: json["quantity"],
    freeQuantity: json["freeQuantity"],
    confirmQuantity: json["confirmQuantity"],
    finalQuantity: json["finalQuantity"],
    finalPtr: json["finalPtr"],
    discountAmount: json["discountAmount"],
    skuId: json["skuId"],
    skuCode: json["skuCode"],
    totalPrice: json["totalPrice"].toDouble(),
    discountPrice: json["discountPrice"],
    itemUrl: json["itemURL"],
    presRequired: json["presRquried"],
    measure: json["measure"],
    status: json["status"],
    gst: json["gst"],
    cgst: json["cgst"],
    sgst: json["sgst"],
    gstPercent: json["gstPercent"],
    cgstPercent: json["cgstPercent"],
    sgstPercent: json["sgstPercent"],
    schemeName: json["schemeName"],
    manufracuter: json["manufracuter"],
    batchNumer: json["batchNumer"],
    hsn: json["hsn"],
    mfdate: json["mfdate"],
    expdate: json["expdate"],
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
    "presRquried": presRequired,
    "measure": measure,
    "status": status,
    "gst": gst,
    "cgst": cgst,
    "sgst": sgst,
    "gstPercent": gstPercent,
    "cgstPercent": cgstPercent,
    "sgstPercent": sgstPercent,
    "schemeName": schemeName,
    "manufracuter": manufracuter,
    "batchNumer": batchNumer,
    "hsn": hsn,
    "mfdate": mfdate,
    "expdate": expdate,
    "packingType": packingType,
    "lineAmount": lineAmount,
  };
}

class Pageable {
  Sort? sort;
  num? pageSize;
  num? pageNumber;
  num? offset;
  bool paged;
  bool unpaged;

  Pageable({
    this.sort,
    this.pageSize,
    this.pageNumber,
    this.offset,
    this.paged = false,
    this.unpaged = false,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
    sort: Sort.fromJson(json["sort"]),
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    offset: json["offset"],
    paged: json["paged"],
    unpaged: json["unpaged"],
  );

  Map<String, dynamic> toJson() => {
    "sort": sort?.toJson(),
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "offset": offset,
    "paged": paged,
    "unpaged": unpaged,
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
