



part of 'authenticate_bloc.dart';
@immutable
abstract class AuthenticateEvent extends Equatable {}

class InitialEvent extends AuthenticateEvent {
  @override
  List<Object?> get props => [];
}

class GetStatusEvent extends AuthenticateEvent {
  final String? phoneNumber;

  GetStatusEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class MarkPaymentEvent extends AuthenticateEvent {
  final String? applicationId;
  final String? chikooResponse;
  final int? installmentNumber;

  MarkPaymentEvent(this.applicationId,this.chikooResponse,this.installmentNumber);

  @override
  List<Object?> get props => [applicationId,chikooResponse,installmentNumber];
}