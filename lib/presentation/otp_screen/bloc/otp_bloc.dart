import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/network/api_services.dart';
import '../../../core/utils/validation_functions.dart';
import '/core/app_export.dart';
import 'package:kistpay_chikoo/presentation/otp_screen/models/otp_model.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc(OtpState initialState, this.context, this.apiService)
      : super(initialState) {
    on<OtpInitialEvent>(_onInitialize);
    on<OtpVerifyEvent>(_onOtpVerify);
  }
  final ApiService apiService;
  final BuildContext context;
  _onInitialize(
    OtpInitialEvent event,
    Emitter<OtpState> emit,
  ) async {}

  Future<void> _onOtpVerify(
      OtpVerifyEvent event, Emitter<OtpState> emit) async {
    emit(state.copyWith(isLoading: true, error: '', success: false));

    try {
      // Make the API call to verify OTP using `event.mobileNumber` and `event.otp`
      final phoneNumber =
          event.mobileNumber!.replaceAll(RegExp(r'^(\+92|0|0092)'), '');

      // Add the prefix "92" to the phone number
      final formattedPhoneNumber = '92$phoneNumber';
      final response =
          await apiService.verifyOTP(formattedPhoneNumber, event.otp!);

      // Simulating API call delay for 2 seconds
      // await Future.delayed(Duration(seconds: 1));

      // Check the response and handle accordingly
      if (response.data['statusCode'] == '00') {
        print(response.data);
        emit(state.copyWith(isLoading: false, success: true));
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(response.data['statusDescription'] ?? 'OTP verified'),
        //     backgroundColor: Colors.green,
        //     behavior: SnackBarBehavior.fixed,
        //   ),
        // );
        showToast(
            message: response.data['statusDescription'] ?? 'OTP verified',
            backgroundColor: Colors.green);
        NavigatorService.pushNamed(
          AppRoutes.phoneListingScreen,
        );
        // Perform any navigation or further actions after OTP verification success
      } else {
        // print(response.data['statusCode']);
        // print('adfasd');
        emit(state.copyWith(
            isLoading: false, success: false, error: response.error));
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(response.data['statusDescription'] ??
        //         'OTP verification failed'),
        //     backgroundColor: Colors.red,
        //     behavior: SnackBarBehavior.fixed,
        //   ),
        // );
        showToast(
            message: response.data['statusDescription'] ?? 'An error occurred.',
            backgroundColor: Colors.red);
        // Perform any error handling or retry logic after OTP verification failure
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(
          isLoading: false,
          success: false,
          error: 'An unexpected error occurred'));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(state.error),
      //     backgroundColor: Colors.red,
      //     behavior: SnackBarBehavior.fixed,
      //   ),
      // );
      showToast(
          message: 'An unexpected error occurred. Please try again later.',
          backgroundColor: Colors.red);
      // Perform any error handling or retry logic after OTP verification failure
    }
  }
}
