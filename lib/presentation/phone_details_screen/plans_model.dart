class FinancingPlan {
  final String? downPayment;
  final List<String>? tenure;
  final List<InstalmentPlan>? instalmentsPlan;

  FinancingPlan({
    this.downPayment,
    this.tenure,
    this.instalmentsPlan,
  });

  factory FinancingPlan.fromJson(Map<String, dynamic> json) {
    return FinancingPlan(
      downPayment: json['downPayment'] as String?,
      tenure: (json['tenure'] as List<dynamic>?)?.cast<String>(),
      instalmentsPlan: (json['instalmentsPlan'] as List<dynamic>?)
          ?.map((item) => InstalmentPlan.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class InstalmentPlan {
  final double? phonePrice;
  final double? downpayment;
  final double? installmentPeriod;
  final double? insuranceCharges;
  final double? totalUpfront;
  final double? financingAmount;
  final double? financingFee;
  final double? monthlyInstallment;
  final double? totalCostOfPhone;
  final double? processingFee;
  final String? installmentDate;

  InstalmentPlan({
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

  factory InstalmentPlan.fromJson(Map<String, dynamic> json) {
    return InstalmentPlan(
      phonePrice: json['phonePrice'] as double?,
      downpayment: json['downpayment'] as double?,
      installmentPeriod: json['installmentPeriod'] as double?,
      insuranceCharges: json['insuranceCharges'] as double?,
      totalUpfront: json['totalUpfront'] as double?,
      financingAmount: json['financingAmount'] as double?,
      financingFee: json['financingFee'] as double?,
      monthlyInstallment: json['monthlyInstallment'] as double?,
      totalCostOfPhone: json['totalCostOfPhone'] as double?,
      processingFee: json['processingFee'] as double?,
      installmentDate: json['installmentDate'] as String?,
    );
  }
}

class FinancingPlansResponse {
  final int? status;
  final String? message;
  final List<FinancingPlan>? data;

  FinancingPlansResponse({
    this.status,
    this.message,
    this.data,
  });

  factory FinancingPlansResponse.fromJson(Map<String, dynamic> json) {
    return FinancingPlansResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => FinancingPlan.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
