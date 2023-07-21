/// address : "string"
/// agentId : 0
/// city : "string"
/// cnicBackURL : "string"
/// cnicFrontURL : "string"
/// companyName : "string"
/// designation : "string"
/// deviceToFinanceId : "string"
/// downPaymentPercentage : 0
/// email : "string"
/// financingCustomer : {"altphoneNumber":"string","cnicNumber":"string","name":"string","phoneNumber":"string"}
/// lastPaidBillURL : "string"
/// maritalStatusId : 0
/// matchPercentage : "string"
/// monthlyIncome : 0
/// proofOfIncomeURL : "string"
/// reference1 : {"name":"string","phoneNumber":"string"}
/// reference1Relation : "string"
/// reference2 : {"name":"string","phoneNumber":"string"}
/// reference2Relation : "string"
/// residentialStatusId : 0
/// retailerCompany : "string"
/// retailerPhoneNumber : "string"
/// selfieImageURL : "string"
/// signatureURL : "string"
/// sourceOfIncome : 0
/// taxCertificateURL : "string"

class SubmitApplicationModel {
  SubmitApplicationModel({
    this.address,
    this.agentId,
    this.city,
    this.cnicBackURL,
    this.cnicFrontURL,
    this.companyName,
    this.designation,
    this.deviceToFinanceId,
    this.downPaymentPercentage,
    this.email,
    this.financingCustomer,
    this.lastPaidBillURL,
    this.maritalStatusId,
    this.matchPercentage,
    this.monthlyIncome,
    this.proofOfIncomeURL,
    this.reference1,
    this.reference1Relation,
    this.reference2,
    this.reference2Relation,
    this.residentialStatusId,
    this.retailerCompany,
    this.retailerPhoneNumber,
    this.selfieImageURL,
    this.signatureURL,
    this.sourceOfIncome,
    this.taxCertificateURL,
    this.gender,
    this.campaignPlanId
  });

  SubmitApplicationModel.fromJson(dynamic json) {
    address = json['address'];
    agentId = json['agentId'];
    city = json['city'];
    cnicBackURL = json['cnicBackURL'];
    cnicFrontURL = json['cnicFrontURL'];
    companyName = json['companyName'];
    designation = json['designation'];
    deviceToFinanceId = json['deviceToFinanceId'];
    downPaymentPercentage = json['downPaymentPercentage'];
    email = json['email'];
    financingCustomer = json['financingCustomer'] != null ? FinancingCustomer.fromJson(json['financingCustomer']) : null;
    lastPaidBillURL = json['lastPaidBillURL'];
    maritalStatusId = json['maritalStatusId'];
    matchPercentage = json['matchPercentage'];
    monthlyIncome = json['monthlyIncome'];
    proofOfIncomeURL = json['proofOfIncomeURL'];
    reference1 = json['reference1'] != null ? Reference1.fromJson(json['reference1']) : null;
    reference1Relation = json['reference1Relation'];
    reference2 = json['reference2'] != null ? Reference2.fromJson(json['reference2']) : null;
    reference2Relation = json['reference2Relation'];
    residentialStatusId = json['residentialStatusId'];
    retailerCompany = json['retailerCompany'];
    retailerPhoneNumber = json['retailerPhoneNumber'];
    selfieImageURL = json['selfieImageURL'];
    signatureURL = json['signatureURL'];
    sourceOfIncome = json['sourceOfIncome'];
    taxCertificateURL = json['taxCertificateURL'];
    gender = json['gender'];
    campaignPlanId=json['campaignPlanId'];
  }
  String? address;
  num? agentId;
  String? city;
  String? cnicBackURL;
  String? cnicFrontURL;
  String? companyName;
  String? designation;
  String? deviceToFinanceId;
  num? downPaymentPercentage;
  String? email;
  FinancingCustomer? financingCustomer;
  String? lastPaidBillURL;
  num? maritalStatusId;
  String? matchPercentage;
  num? monthlyIncome;
  String? proofOfIncomeURL;
  Reference1? reference1;
  String? reference1Relation;
  Reference2? reference2;
  String? reference2Relation;
  num? residentialStatusId;
  String? retailerCompany;
  String? retailerPhoneNumber;
  String? selfieImageURL;
  String? signatureURL;
  num? sourceOfIncome;
  String? taxCertificateURL;
  String? gender;
  num? campaignPlanId;
  SubmitApplicationModel copyWith({  String? address,
    num? agentId,
    String? city,
    String? cnicBackURL,
    String? cnicFrontURL,
    String? companyName,
    String? designation,
    String? deviceToFinanceId,
    num? downPaymentPercentage,
    num? campaignPlanId,
    String? email,
    FinancingCustomer? financingCustomer,
    String? lastPaidBillURL,
    num? maritalStatusId,
    String? matchPercentage,
    num? monthlyIncome,
    String? proofOfIncomeURL,
    Reference1? reference1,
    String? reference1Relation,
    Reference2? reference2,
    String? reference2Relation,
    num? residentialStatusId,
    String? retailerCompany,
    String? retailerPhoneNumber,
    String? selfieImageURL,
    String? signatureURL,
    num? sourceOfIncome,
    String? taxCertificateURL,
    String? gender,
  }) => SubmitApplicationModel(  address: address ?? this.address,
      agentId: agentId ?? this.agentId,
      city: city ?? this.city,
      cnicBackURL: cnicBackURL ?? this.cnicBackURL,
      cnicFrontURL: cnicFrontURL ?? this.cnicFrontURL,
      companyName: companyName ?? this.companyName,
      designation: designation ?? this.designation,
      deviceToFinanceId: deviceToFinanceId ?? this.deviceToFinanceId,
      downPaymentPercentage: downPaymentPercentage ?? this.downPaymentPercentage,
      email: email ?? this.email,
      financingCustomer: financingCustomer ?? this.financingCustomer,
      lastPaidBillURL: lastPaidBillURL ?? this.lastPaidBillURL,
      maritalStatusId: maritalStatusId ?? this.maritalStatusId,
      matchPercentage: matchPercentage ?? this.matchPercentage,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      proofOfIncomeURL: proofOfIncomeURL ?? this.proofOfIncomeURL,
      reference1: reference1 ?? this.reference1,
      reference1Relation: reference1Relation ?? this.reference1Relation,
      reference2: reference2 ?? this.reference2,
      reference2Relation: reference2Relation ?? this.reference2Relation,
      residentialStatusId: residentialStatusId ?? this.residentialStatusId,
      retailerCompany: retailerCompany ?? this.retailerCompany,
      retailerPhoneNumber: retailerPhoneNumber ?? this.retailerPhoneNumber,
      selfieImageURL: selfieImageURL ?? this.selfieImageURL,
      signatureURL: signatureURL ?? this.signatureURL,
      sourceOfIncome: sourceOfIncome ?? this.sourceOfIncome,
      taxCertificateURL: taxCertificateURL ?? this.taxCertificateURL,
      gender:gender??this.gender,
      campaignPlanId: campaignPlanId??this.campaignPlanId
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['agentId'] = agentId;
    map['city'] = city;
    map['cnicBackURL'] = cnicBackURL;
    map['cnicFrontURL'] = cnicFrontURL;
    map['companyName'] = companyName;
    map['designation'] = designation;
    map['deviceToFinanceId'] = deviceToFinanceId;
    map['downPaymentPercentage'] = downPaymentPercentage;
    map['email'] = email;
    if (financingCustomer != null) {
      map['financingCustomer'] = financingCustomer?.toJson();
    }
    map['lastPaidBillURL'] = lastPaidBillURL;
    map['maritalStatusId'] = maritalStatusId;
    map['matchPercentage'] = matchPercentage;
    map['monthlyIncome'] = monthlyIncome;
    map['proofOfIncomeURL'] = proofOfIncomeURL;
    if (reference1 != null) {
      map['reference1'] = reference1?.toJson();
    }
    map['reference1Relation'] = reference1Relation;
    if (reference2 != null) {
      map['reference2'] = reference2?.toJson();
    }
    map['reference2Relation'] = reference2Relation;
    map['residentialStatusId'] = residentialStatusId;
    map['retailerCompany'] = retailerCompany;
    map['retailerPhoneNumber'] = retailerPhoneNumber;
    map['selfieImageURL'] = selfieImageURL;
    map['signatureURL'] = signatureURL;
    map['sourceOfIncome'] = sourceOfIncome;
    map['taxCertificateURL'] = taxCertificateURL;
    map['gender'] = gender;
    map['campaignPlanId'] = campaignPlanId;
    return map;
  }

}

/// name : "string"
/// phoneNumber : "string"

class Reference2 {
  Reference2({
    this.name,
    this.phoneNumber,});

  Reference2.fromJson(dynamic json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
  }
  String? name;
  String? phoneNumber;
  Reference2 copyWith({  String? name,
    String? phoneNumber,
  }) => Reference2(  name: name ?? this.name,
    phoneNumber: phoneNumber ?? this.phoneNumber,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

}

/// name : "string"
/// phoneNumber : "string"

class Reference1 {
  Reference1({
    this.name,
    this.phoneNumber,});

  Reference1.fromJson(dynamic json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
  }
  String? name;
  String? phoneNumber;
  Reference1 copyWith({  String? name,
    String? phoneNumber,
  }) => Reference1(  name: name ?? this.name,
    phoneNumber: phoneNumber ?? this.phoneNumber,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

}

/// altphoneNumber : "string"
/// cnicNumber : "string"
/// name : "string"
/// phoneNumber : "string"

class FinancingCustomer {
  FinancingCustomer({
    this.altphoneNumber,
    this.cnicNumber,
    this.name,
    this.phoneNumber,});

  FinancingCustomer.fromJson(dynamic json) {
    altphoneNumber = json['altphoneNumber'];
    cnicNumber = json['cnicNumber'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
  }
  String? altphoneNumber;
  String? cnicNumber;
  String? name;
  String? phoneNumber;
  FinancingCustomer copyWith({  String? altphoneNumber,
    String? cnicNumber,
    String? name,
    String? phoneNumber,
  }) => FinancingCustomer(  altphoneNumber: altphoneNumber ?? this.altphoneNumber,
    cnicNumber: cnicNumber ?? this.cnicNumber,
    name: name ?? this.name,
    phoneNumber: phoneNumber ?? this.phoneNumber,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['altphoneNumber'] = altphoneNumber;
    map['cnicNumber'] = cnicNumber;
    map['name'] = name;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

}