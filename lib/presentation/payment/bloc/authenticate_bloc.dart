import 'package:equatable/equatable.dart';

import '../../../core/app_export.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  AuthenticateBloc(
    AuthenticateState initialState,
    this.context,
  ) : super(initialState) {
    on<AuthenticateEvent>(_onInitialize);
    on<GetStatusEvent>(_getStatus);
    on<MarkPaymentEvent>(_markPayment);
  }
  final BuildContext context;
  _onInitialize(
    AuthenticateEvent event,
    Emitter<AuthenticateState> emit,
  ) async {
    emit(state.copyWith(phoneController: TextEditingController()));
  }

  Future<void> _getStatus(
    GetStatusEvent event,
    Emitter<AuthenticateState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: '', success: false));

    try {
      // Make the API call to generate OTP using `event.phoneNumber`
      // Example:
      // Extract the digits after removing any leading zeros, "0092", or "+92"
      final phoneNumber =
          event.phoneNumber?.replaceAll(RegExp(r'^(\+92|0|0092)'), '');
      final ApiService apiService = ApiService();

      // Add the prefix "92" to the phone number
      final formattedPhoneNumber = '+92$phoneNumber';
      print('object');
      print(formattedPhoneNumber);
      final response = await apiService.getStatus(formattedPhoneNumber);
      print('object${response.data}');
      // Simulating API call delay for 2 seconds
      // await Future.delayed(Duration(seconds: 1));

      // Check the response and handle accordingly
      // Example:
      if (response.success) {
        emit(state.copyWith(
            isLoading: false, success: true, data: response.data));

        if ( response.data!=null&& response.data['data']['financingInstalment'] != null) {
          NavigatorService.pushNamed(
            AppRoutes.paymentScreen,
          );
        } else {
          showToast(message: 'No Application found', backgroundColor: Colors.green);
        }
      } else {
        emit(state.copyWith(
            isLoading: false, success: false, error: response.error));
        showToast(
              message: response.error ?? 'An error occurred.',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      emit(
          state.copyWith(isLoading: false, success: false, error: state.error));

      showToast(
          message: 'An unexpected error occurred. Please try again later.',
          backgroundColor: Colors.red);
    }
  }

  Future<void> _markPayment(
    MarkPaymentEvent event,
    Emitter<AuthenticateState> emit,
  ) async {
    LoadingDialog.showLoadingDialog(context: context);
    emit(state.copyWith(isLoading: true, error: '', success: false));

    try {
      final ApiService apiService = ApiService();

      final response = await apiService.markPayment(
          chikooResponse: event.chikooResponse,
          applicationId: event.applicationId,
          installmentNumber: event.installmentNumber);


      print('markdownPayment${response.data}');
      // ignore: use_build_context_synchronously
      LoadingDialog.hideLoadingDialog(context: context);
      if (response.success) {
        emit(state.copyWith(
            isLoading: false, success: true, data: response.data));
        showToast(
            message: response.data['message'], backgroundColor: Colors.green);
        Navigator.popUntil(context, (route) => route.isFirst);


      } else {
        emit(state.copyWith(
            isLoading: false, success: false, error: response.error));
        showToast(
            message: response.error ?? 'An error occurred.',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      LoadingDialog.hideLoadingDialog(context: context);
      emit(
          state.copyWith(isLoading: false, success: false, error: state.error));

      showToast(
          message: 'An unexpected error occurred. Please try again later.',
          backgroundColor: Colors.red);
    }
  }
}
