// ignore_for_file: must_be_immutable

part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent extends Equatable {}

class OtpInitialEvent extends OtpEvent {
  @override
  List<Object?> get props => [];
}
class OtpVerifyEvent extends OtpEvent {
  final String? mobileNumber;
  final int? otp;

   OtpVerifyEvent({
     this.mobileNumber,
     this.otp,
  });

  @override
  List<Object?> get props => [mobileNumber, otp];
}