// ignore_for_file: must_be_immutable

part of 'login_screnn_bloc.dart';

@immutable
abstract class LoginScrennEvent extends Equatable {}

class LoginScrennInitialEvent extends LoginScrennEvent {
  @override
  List<Object?> get props => [];
}
class GenerateOTPEvent extends LoginScrennEvent {
  final String phoneNumber;

   GenerateOTPEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class ResendOTPEvent extends LoginScrennEvent {
  final String phoneNumber;

  ResendOTPEvent(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}