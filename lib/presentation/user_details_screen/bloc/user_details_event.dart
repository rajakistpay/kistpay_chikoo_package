// ignore_for_file: must_be_immutable

part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsEvent extends Equatable {}

class UserDetailsInitialEvent extends UserDetailsEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing radio button
class ChangeRadioButtonEvent extends UserDetailsEvent {
  ChangeRadioButtonEvent({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class GenderEvent extends UserDetailsEvent {
  GenderEvent({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class MaritalStatus extends UserDetailsEvent {
  MaritalStatus({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class FirstReference extends UserDetailsEvent {
  FirstReference({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

//SecondReference
class SecondReference extends UserDetailsEvent {
  SecondReference({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}
