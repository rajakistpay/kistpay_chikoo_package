
part of 'authenticate_bloc.dart';



class AuthenticateState extends Equatable {
  final TextEditingController? phoneController;

  final bool isLoading;
  final String error;
  final bool success;
  final dynamic data;

  const AuthenticateState(
      {this.phoneController,
        this.isLoading = false,
        this.error = '',
        this.success = false,
        this.data});

  @override
  List<Object?> get props => [phoneController, isLoading, error, success, data];

  AuthenticateState copyWith(
      {TextEditingController? phoneController,
        bool? isLoading,
        String? error,
        bool? success,
        dynamic data}) {
    return AuthenticateState(
        phoneController: phoneController ?? this.phoneController,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        success: success ?? this.success,
        data: data ?? this.data);
  }
}
