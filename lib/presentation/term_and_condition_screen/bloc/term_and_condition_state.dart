// ignore_for_file: must_be_immutable

part of 'term_and_condition_bloc.dart';

class TermAndConditionState extends Equatable {
  TermAndConditionState({
    this.termAndConditionModelObj,
    this.isLoading = false,
    this.error = '',
    this.success = false,
    this.message
  });

  TermAndConditionModel? termAndConditionModelObj;
  final bool isLoading;
  final String error;
  final bool success;
  final String? message;

  @override
  List<Object?> get props => [
        termAndConditionModelObj,
        isLoading,
        error,
        success,
    message,
      ];
  TermAndConditionState copyWith({
    TermAndConditionModel? termAndConditionModelObj,
    bool? isLoading,
    String? error,
    bool? success,
     String? message,
  }) {
    return TermAndConditionState(
      termAndConditionModelObj:
          termAndConditionModelObj ?? this.termAndConditionModelObj,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      success: success ?? this.success,
      message: message??this.message
    );
  }
}
