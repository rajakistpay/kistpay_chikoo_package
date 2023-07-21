// ignore_for_file: must_be_immutable

part of 'login_screnn_bloc.dart';

class LoginScreenState extends Equatable {
  final TextEditingController? phoneController;
  final LoginScreenModel? loginScreenModelObj;
  final bool isLoading;
  final String error;
  final bool success;

  const LoginScreenState({
    this.phoneController,
    this.loginScreenModelObj,
    this.isLoading = false,
    this.error = '',
    this.success = false,
  });

  @override
  List<Object?> get props => [
    phoneController,
    loginScreenModelObj,
      isLoading,
      error,
      success,
  ];

  LoginScreenState copyWith({
    TextEditingController? phoneController,
    LoginScreenModel? loginScreenModelObj,
    bool? isLoading,
    String? error,
    bool? success,
  }) {
    return LoginScreenState(
      phoneController: phoneController ?? this.phoneController,
      loginScreenModelObj: loginScreenModelObj ?? this.loginScreenModelObj,
    isLoading: isLoading ?? this.isLoading,
    error: error ?? this.error,
    success: success ?? this.success,
    );
  }
}
