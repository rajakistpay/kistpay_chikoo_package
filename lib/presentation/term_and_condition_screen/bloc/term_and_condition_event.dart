// ignore_for_file: must_be_immutable

part of 'term_and_condition_bloc.dart';

@immutable
abstract class TermAndConditionEvent extends Equatable {}

class TermAndConditionInitialEvent extends TermAndConditionEvent {
  @override
  List<Object?> get props => [];
}


class SubmitApplicationEvent extends TermAndConditionEvent {

  SubmitApplicationEvent();
  @override
  List<Object?> get props => [];
}