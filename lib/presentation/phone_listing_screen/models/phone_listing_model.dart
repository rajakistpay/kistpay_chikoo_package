import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PhoneListingModel extends Equatable {
  PhoneListingModel({
    this.status,
    this.message,
    this.data,
  });

  PhoneListingModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(MobileData.fromJson(v));
      });
    }
  }

  num? status;
  dynamic message;
  List<MobileData>? data;

  PhoneListingModel copyWith({
    num? status,
    dynamic message,
    List<MobileData>? data,
  }) =>
      PhoneListingModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  List<Object?> get props => [status, message, data];
}

class MobileData {
  MobileData({
    this.deviceName,
    this.price,
    this.discountedPrice,
    this.brand,
    this.ram,
    this.rom,
    this.isDeleted,
    this.stockedUnit,
    this.financeDeviceVendorPublicId,
    this.devicePublicId,
    this.isDlcEnable,
    this.image
  });

  MobileData.fromJson(dynamic json) {
    deviceName = json['deviceName'];
    price = json['price'];
    discountedPrice = json['discountedPrice'];
    brand = json['brand'];
    ram = json['ram'];
    rom = json['rom'];
    isDeleted = json['isDeleted'];
    stockedUnit = json['stockedUnit'];
    financeDeviceVendorPublicId = json['financeDeviceVendorPublicId'];
    devicePublicId = json['devicePublicId'];
    isDlcEnable = json['isDlcEnable'];
    image=json['image'];

  }

  String? deviceName;
  String? price;
  String? discountedPrice;
  String? brand;
  String? ram;
  String? rom;
  bool? isDeleted;
  num? stockedUnit;
  String? financeDeviceVendorPublicId;
  String? devicePublicId;
  bool? isDlcEnable;
  String? image;

  MobileData copyWith({
    String? deviceName,
    String? price,
    String? discountedPrice,
    String? brand,
    String? ram,
    String? rom,
    bool? isDeleted,
    num? stockedUnit,
    String? financeDeviceVendorPublicId,
    String? devicePublicId,
    bool? isDlcEnable,
    String? image

  }) =>
      MobileData(
        deviceName: deviceName ?? this.deviceName,
        price: price ?? this.price,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        brand: brand ?? this.brand,
        ram: ram ?? this.ram,
        rom: rom ?? this.rom,
        isDeleted: isDeleted ?? this.isDeleted,
        stockedUnit: stockedUnit ?? this.stockedUnit,
        financeDeviceVendorPublicId:
        financeDeviceVendorPublicId ?? this.financeDeviceVendorPublicId,
        devicePublicId: devicePublicId ?? this.devicePublicId,
        isDlcEnable: isDlcEnable ?? this.isDlcEnable,
        image:image??this.image
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deviceName'] = deviceName;
    map['price'] = price;
    map['discountedPrice'] = discountedPrice;
    map['brand'] = brand;
    map['ram'] = ram;
    map['rom'] = rom;
    map['isDeleted'] = isDeleted;
    map['stockedUnit'] = stockedUnit;
    map['financeDeviceVendorPublicId'] = financeDeviceVendorPublicId;
    map['devicePublicId'] = devicePublicId;
    map['isDlcEnable'] = isDlcEnable;
    map['image']=image;
    return map;
  }
}
