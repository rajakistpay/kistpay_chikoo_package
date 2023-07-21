import 'package:intl/intl.dart';

class PhoneDetailsResponse {
  final int? status;
  final String? message;
  final PhoneDetailsData? data;

  PhoneDetailsResponse({
    this.status,
    this.message,
    this.data,
  });

  factory PhoneDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PhoneDetailsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: PhoneDetailsData.fromJson(json['data'] as Map<String, dynamic>?),
    );
  }
}

class PhoneDetailsData {
  final num? phonePrice;
  final num? downpayment;
  final num? installmentPeriod;
  final num? insuranceCharges;
  final num? totalUpfront;
  final num? financingAmount;
  final num? financingFee;
  final num? monthlyInstallment;
  final num? totalCostOfPhone;
  final num? processingFee;
  final DateTime? installmentDate;

  PhoneDetailsData({
    this.phonePrice,
    this.downpayment,
    this.installmentPeriod,
    this.insuranceCharges,
    this.totalUpfront,
    this.financingAmount,
    this.financingFee,
    this.monthlyInstallment,
    this.totalCostOfPhone,
    this.processingFee,
    this.installmentDate,
  });

  factory PhoneDetailsData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return PhoneDetailsData();
    }
    DateTime? parsedDate;
    if (json['installmentDate'] != null) {
      final dateString = json['installmentDate'] as String?;
      if (dateString != null) {
        final format = DateFormat("MM/dd/yyyy HH:mm:ss");
        parsedDate = format.parse(dateString);
      }
    }
    return PhoneDetailsData(
      phonePrice: json['phonePrice'] as num?,
      downpayment: json['downpayment'] as num?,
      installmentPeriod: json['installmentPeriod'] as num?,
      insuranceCharges: json['insuranceCharges'] as num?,
      totalUpfront: json['totalUpfront'] as num?,
      financingAmount: json['financingAmount'] as num?,
      financingFee: json['financingFee'] as num?,
      monthlyInstallment: json['monthlyInstallment'] as num?,
      totalCostOfPhone: json['totalCostOfPhone'] as num?,
      processingFee: json['processingFee'] as num?,
      installmentDate: parsedDate
    );
  }
}
