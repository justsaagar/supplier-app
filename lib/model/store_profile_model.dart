import 'dart:convert';

StoreProfileModel storeProfileModelFromJson(String str) => StoreProfileModel.fromJson(json.decode(str));

String storeProfileModelToJson(StoreProfileModel data) => json.encode(data.toJson());

class StoreProfileModel {
  String? id;
  String? email;
  String? phoneNumber;
  String? password;
  String? otp;
  String? storeName;
  String? businessType;
  String? storeCategory;
  String? storeCategoryId;
  String? ownerName;
  String? isDeleted;
  String? isActive;
  String? createdAt;
  String? createdBy;
  dynamic modifiedBy;
  dynamic modifiedDate;
  String? dealsIn;
  String? popularIn;
  String? storeNumber;
  String? openTime;
  String? closeTime;
  dynamic deliveryStrength;
  String? applicationStatus;
  DateTime? applicationStatusDate;
  String? boarded;
  DateTime? retailerBirthday;
  DateTime? retailerMarriageDay;
  DateTime? retailerChildOneBirthDay;
  DateTime? retailerChildTwoBirthDay;
  String? retailerMessage;
  String? storeRating;
  String? storeLiveStatus;
  String? storeDisplayId;
  bool? profileUpdateEnable;
  Gst? gst;
  StoreLicense? storeLicense;
  DrugLicense? drugLicense;
  dynamic deliveryType;
  List<Slot> slots;
  List<StoreAddressDetailRequest> storeAddressDetailRequest;
  ImageUrl? imageUrl;
  dynamic drugLicenseAddress;
  dynamic reason;
  num? gstVerifed;
  num? storeLicenseVerifed;
  num? drugLicenseVerifed;
  String? registeredPharmacistName;
  String? fcmToken;
  dynamic webFcmToken;
  String? centralStore;
  String? accountNumber;
  String? accuntName;
  String? ifsc;
  String? bankbranch;
  String? bank;
  String? googlepay;
  String? phonepay;
  String? paytm;

  StoreProfileModel({
    this.id,
    this.email,
    this.phoneNumber,
    this.password,
    this.otp,
    this.storeName,
    this.businessType,
    this.storeCategory,
    this.storeCategoryId,
    this.ownerName,
    this.isDeleted,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.modifiedBy,
    this.modifiedDate,
    this.dealsIn,
    this.popularIn,
    this.storeNumber,
    this.openTime,
    this.closeTime,
    this.deliveryStrength,
    this.applicationStatus,
    this.applicationStatusDate,
    this.boarded,
    this.retailerBirthday,
    this.retailerMarriageDay,
    this.retailerChildOneBirthDay,
    this.retailerChildTwoBirthDay,
    this.retailerMessage,
    this.storeRating,
    this.storeLiveStatus,
    this.storeDisplayId,
    this.profileUpdateEnable,
    this.gst,
    this.storeLicense,
    this.drugLicense,
    this.deliveryType,
    this.slots = const <Slot>[],
    this.storeAddressDetailRequest = const <StoreAddressDetailRequest>[],
    this.imageUrl,
    this.drugLicenseAddress,
    this.reason,
    this.gstVerifed,
    this.storeLicenseVerifed,
    this.drugLicenseVerifed,
    this.registeredPharmacistName,
    this.fcmToken,
    this.webFcmToken,
    this.centralStore,
    this.accountNumber,
    this.accuntName,
    this.ifsc,
    this.bankbranch,
    this.bank,
    this.googlepay,
    this.phonepay,
    this.paytm,
  });

  factory StoreProfileModel.fromJson(Map<String, dynamic> json) =>
      StoreProfileModel(
        id: json["id"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        otp: json["otp"],
        storeName: json["storeName"],
        businessType: json["businessType"],
        storeCategory: json["storeCategory"],
        storeCategoryId: json["storeCategoryId"],
        ownerName: json["ownerName"],
        isDeleted: json["isDeleted"],
        isActive: json["isActive"],
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        modifiedBy: json["modifiedBy"],
        modifiedDate: json["modifiedDate"],
        dealsIn: json["dealsIn"],
        popularIn: json["popularIn"],
        storeNumber: json["storeNumber"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        deliveryStrength: json["deliveryStrength"],
        applicationStatus: json["applicationStatus"],
        applicationStatusDate: DateTime.parse(json["applicationStatusDate"]),
        boarded: json["boarded"],
        retailerBirthday: DateTime.parse(json["retailerBirthday"]),
        retailerMarriageDay: DateTime.parse(json["retailerMarriageDay"]),
        retailerChildOneBirthDay:
            DateTime.parse(json["retailerChildOneBirthDay"]),
        retailerChildTwoBirthDay:
            DateTime.parse(json["retailerChildTwoBirthDay"]),
        retailerMessage: json["retailerMessage"],
        storeRating: json["storeRating"],
        storeLiveStatus: json["storeLiveStatus"],
        storeDisplayId: json["storeDisplayid"],
        profileUpdateEnable: json["profileUpdateEnbale"],
        gst: Gst.fromJson(json["gst"]),
        storeLicense: StoreLicense.fromJson(json["storeLicense"]),
        drugLicense: DrugLicense.fromJson(json["drugLicense"]),
        deliveryType: json["deliveryType"],
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromJson(x))),
        storeAddressDetailRequest: List<StoreAddressDetailRequest>.from(
            json["storeAddressDetailRequest"]
                .map((x) => StoreAddressDetailRequest.fromJson(x))),
        imageUrl: ImageUrl.fromJson(json["imageUrl"]),
        drugLicenseAddress: json["drugLicenseAddress"],
        reason: json["reason"],
        gstVerifed: json["gstVerifed"],
        storeLicenseVerifed: json["storeLicenseVerifed"],
        drugLicenseVerifed: json["drugLicenseVerifed"],
        registeredPharmacistName: json["registeredPharmacistName"],
        fcmToken: json["fcmToken"],
        webFcmToken: json["webFcmToken"],
        centralStore: json["centralStore"],
        accountNumber: json["accountNumber"],
        accuntName: json["accuntName"],
        ifsc: json["ifsc"],
        bankbranch: json["bankbranch"],
        bank: json["bank"],
        googlepay: json["googlepay"],
        phonepay: json["phonepay"],
        paytm: json["paytm"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "otp": otp,
        "storeName": storeName,
        "businessType": businessType,
        "storeCategory": storeCategory,
        "storeCategoryId": storeCategoryId,
        "ownerName": ownerName,
        "isDeleted": isDeleted,
        "isActive": isActive,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "modifiedBy": modifiedBy,
        "modifiedDate": modifiedDate,
        "dealsIn": dealsIn,
        "popularIn": popularIn,
        "storeNumber": storeNumber,
        "openTime": openTime,
        "closeTime": closeTime,
        "deliveryStrength": deliveryStrength,
        "applicationStatus": applicationStatus,
        "applicationStatusDate":
            "${applicationStatusDate!.year.toString().padLeft(4, '0')}-${applicationStatusDate?.month.toString().padLeft(2, '0')}-${applicationStatusDate?.day.toString().padLeft(2, '0')}",
        "boarded": boarded,
        "retailerBirthday":
            "${retailerBirthday?.year.toString().padLeft(4, '0')}-${retailerBirthday?.month.toString().padLeft(2, '0')}-${retailerBirthday?.day.toString().padLeft(2, '0')}",
        "retailerMarriageDay":
            "${retailerMarriageDay?.year.toString().padLeft(4, '0')}-${retailerMarriageDay?.month.toString().padLeft(2, '0')}-${retailerMarriageDay?.day.toString().padLeft(2, '0')}",
        "retailerChildOneBirthDay":
            "${retailerChildOneBirthDay?.year.toString().padLeft(4, '0')}-${retailerChildOneBirthDay?.month.toString().padLeft(2, '0')}-${retailerChildOneBirthDay?.day.toString().padLeft(2, '0')}",
        "retailerChildTwoBirthDay":
            "${retailerChildTwoBirthDay?.year.toString().padLeft(4, '0')}-${retailerChildTwoBirthDay?.month.toString().padLeft(2, '0')}-${retailerChildTwoBirthDay?.day.toString().padLeft(2, '0')}",
        "retailerMessage": retailerMessage,
        "storeRating": storeRating,
        "storeLiveStatus": storeLiveStatus,
        "storeDisplayid": storeDisplayId,
        "profileUpdateEnbale": profileUpdateEnable,
        "gst": gst?.toJson(),
        "storeLicense": storeLicense?.toJson(),
        "drugLicense": drugLicense?.toJson(),
        "deliveryType": deliveryType,
        "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
        "storeAddressDetailRequest": List<dynamic>.from(
            storeAddressDetailRequest.map((x) => x.toJson())),
        "imageUrl": imageUrl?.toJson(),
        "drugLicenseAddress": drugLicenseAddress,
        "reason": reason,
        "gstVerifed": gstVerifed,
        "storeLicenseVerifed": storeLicenseVerifed,
        "drugLicenseVerifed": drugLicenseVerifed,
        "registeredPharmacistName": registeredPharmacistName,
        "fcmToken": fcmToken,
        "webFcmToken": webFcmToken,
        "centralStore": centralStore,
        "accountNumber": accountNumber,
        "accuntName": accuntName,
        "ifsc": ifsc,
        "bankbranch": bankbranch,
        "bank": bank,
        "googlepay": googlepay,
        "phonepay": phonepay,
        "paytm": paytm,
      };
}

class DrugLicense {
  String? drugLicenseNumber;
  String? documentId;

  DrugLicense({
    this.drugLicenseNumber,
    this.documentId,
  });

  factory DrugLicense.fromJson(Map<String, dynamic> json) => DrugLicense(
        drugLicenseNumber: json["drugLicenseNumber"],
        documentId: json["documentId"],
      );

  Map<String, dynamic> toJson() => {
        "drugLicenseNumber": drugLicenseNumber,
        "documentId": documentId,
      };
}

class Gst {
  String? gstNumber;
  String? docUrl;

  Gst({
    this.gstNumber,
    this.docUrl,
  });

  factory Gst.fromJson(Map<String, dynamic> json) => Gst(
        gstNumber: json["gstNumber"],
        docUrl: json["docUrl"],
      );

  Map<String, dynamic> toJson() => {
        "gstNumber": gstNumber,
        "docUrl": docUrl,
      };
}

class ImageUrl {
  String? bannerImageId;
  String? profileImageId;

  ImageUrl({
    this.bannerImageId,
    this.profileImageId,
  });

  factory ImageUrl.fromJson(Map<String, dynamic> json) => ImageUrl(
        bannerImageId: json["bannerImageId"],
        profileImageId: json["profileImageId"],
      );

  Map<String, dynamic> toJson() => {
        "bannerImageId": bannerImageId,
        "profileImageId": profileImageId,
      };
}

class Slot {
  String? slotId;
  String? slotName;
  String? startTime;
  String? endTime;
  bool isChecked;
  num? displayOrder;

  Slot({
    this.slotId,
    this.slotName,
    this.startTime,
    this.endTime,
    this.isChecked = false,
    this.displayOrder,
  });

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        slotId: json["slotId"],
        slotName: json["slotName"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        isChecked: json["isChecked"],
        displayOrder: json["displayOrder"],
      );

  Map<String, dynamic> toJson() => {
        "slotId": slotId,
        "slotName": slotName,
        "startTime": startTime,
        "endTime": endTime,
        "isChecked": isChecked,
        "displayOrder": displayOrder,
      };
}

class StoreAddressDetailRequest {
  String? mobileNumber;
  String? name;
  String? addressLineMobileOne;
  String? addressLineMobileTwo;
  String? addressType;
  String? alterNateMobileNumber;
  String? emailId;
  String? pinCode;
  String? addressLine1;
  String? addressLine2;
  String? landMark;
  String? city;
  String? region;
  String? state;
  String? latitude;
  String? longitude;
  GeoLocation? geoLocation;

  StoreAddressDetailRequest({
    this.mobileNumber,
    this.name,
    this.addressLineMobileOne,
    this.addressLineMobileTwo,
    this.addressType,
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

  factory StoreAddressDetailRequest.fromJson(Map<String, dynamic> json) =>
      StoreAddressDetailRequest(
        mobileNumber: json["mobileNumber"],
        name: json["name"],
        addressLineMobileOne: json["addresslineMobileOne"],
        addressLineMobileTwo: json["addresslineMobileTwo"],
        addressType: json["addressType"],
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
        geoLocation: GeoLocation.fromJson(json["geoLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "name": name,
        "addresslineMobileOne": addressLineMobileOne,
        "addresslineMobileTwo": addressLineMobileTwo,
        "addressType": addressType,
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
  String? type;
  List<num> coordinates;

  GeoLocation({
    this.x,
    this.y,
    this.type,
    this.coordinates = const <num>[],
  });

  factory GeoLocation.fromJson(Map<String, dynamic> json) => GeoLocation(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class StoreLicense {
  String? storeLicenseNumber;
  String? docUrl;

  StoreLicense({
    this.storeLicenseNumber,
    this.docUrl,
  });

  factory StoreLicense.fromJson(Map<String, dynamic> json) => StoreLicense(
        storeLicenseNumber: json["storeLicenseNumber"],
        docUrl: json["docUrl"],
      );

  Map<String, dynamic> toJson() => {
        "storeLicenseNumber": storeLicenseNumber,
        "docUrl": docUrl,
      };
}
