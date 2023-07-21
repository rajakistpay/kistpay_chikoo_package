// ignore_for_file: must_be_immutable

part of 'otp_bloc.dart';



class OtpState extends Equatable {
  final OtpModel? otpModelObj;
  final bool isLoading;
  final bool success;
  final String error;

  const OtpState({
    this.otpModelObj,
    this.isLoading = false,
    this.success = false,
    this.error = '',
  });

  @override
  List<Object?> get props => [otpModelObj, isLoading, success, error];

  OtpState copyWith({
    OtpModel? otpModelObj,
    bool? isLoading,
    bool? success,
    String? error,
  }) {
    return OtpState(
      otpModelObj: otpModelObj ?? this.otpModelObj,
      isLoading: isLoading ?? this.isLoading,
      success: success ?? this.success,
      error: error ?? this.error,
    );
  }
}

