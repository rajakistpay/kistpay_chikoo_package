// ignore_for_file: must_be_immutable

part of 'kyc_bloc.dart';

class KycState extends Equatable {
  KycState(
      {this.kycModelObj,
      this.frontCnicPath,
      this.backCnicPath,
      this.selfiePath,
      this.incomeProofPath,
      this.utilityBills,
      this.isLoading = false,
      this.error = '',
      this.success = false,
      this.fontCnicImageUrl,
      this.backCnicImageUrl,
      this.selfieUrl,
      this.incomeProofUrl,
      this.utilityUrl});

  KycModel? kycModelObj;
  String? frontCnicPath;
  String? backCnicPath;
  String? selfiePath;
  String? incomeProofPath;
  String? utilityBills;
  bool isLoading;
  String error;
  bool success;
  String? fontCnicImageUrl;
  String? backCnicImageUrl;
  String? incomeProofUrl;
  String? selfieUrl;
  String? utilityUrl;

  @override
  List<Object?> get props => [
        kycModelObj,
        frontCnicPath,
        backCnicPath,
        selfiePath,
        incomeProofPath,
        utilityBills,
        isLoading,
        error,
        success,
        fontCnicImageUrl,
        backCnicImageUrl,
        selfieUrl,
        incomeProofUrl,
        utilityUrl
      ];

  KycState copyWith(
      {KycModel? kycModelObj,
      String? frontCnicPath,
      String? backCnicPath,
      String? selfiePath,
      String? incomeProofPath,
      String? utilityBills,
      bool? isLoading,
      String? error,
      bool? success,
      String? fontCnicImageUrl,
      String? backCnicImageUrl,
      String? incomeProofUrl,
      String? selfieUrl,
      String? utilityUrl}) {
    return KycState(
        kycModelObj: kycModelObj ?? this.kycModelObj,
        frontCnicPath: frontCnicPath ?? this.frontCnicPath,
        backCnicPath: backCnicPath ?? this.backCnicPath,
        selfiePath: selfiePath ?? this.selfiePath,
        incomeProofPath: incomeProofPath ?? this.incomeProofPath,
        utilityBills: utilityBills ?? this.utilityBills,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        success: success ?? this.success,
        fontCnicImageUrl: fontCnicImageUrl ?? this.fontCnicImageUrl,
        backCnicImageUrl: backCnicImageUrl ?? this.backCnicImageUrl,
        selfieUrl: selfieUrl ?? this.selfieUrl,
        utilityUrl: utilityUrl ?? this.utilityUrl,
        incomeProofUrl: incomeProofUrl ?? this.incomeProofUrl);
  }

  bool areAllImagesNull() {
    return frontCnicPath == null ||
        backCnicPath == null ||
        selfiePath == null ;
  }

  bool utilityNull() {
    return incomeProofPath == null || utilityBills == null;
  }
}
