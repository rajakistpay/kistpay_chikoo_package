import 'package:equatable/equatable.dart';

import '/core/app_export.dart';
part 'login_screnn_event.dart';
part 'login_screnn_state.dart';

class LoginScreenBloc extends Bloc<LoginScrennEvent, LoginScreenState> {
  LoginScreenBloc(LoginScreenState initialState, this.apiService, this.context)
      : super(initialState) {
    on<LoginScrennInitialEvent>(_onInitialize);
    on<GenerateOTPEvent>(_onGenerateOTP);
    on<ResendOTPEvent>(_resendOtp);
  }
  final ApiService apiService;
  final BuildContext context;
  _onInitialize(
    LoginScrennInitialEvent event,
    Emitter<LoginScreenState> emit,
  ) async {
    emit(state.copyWith(phoneController: TextEditingController()));
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   NavigatorService.popAndPushNamed(
    //     AppRoutes.otpScreen,
    //   );
    // });
  }

  Future<void> _onGenerateOTP(
    GenerateOTPEvent event,
    Emitter<LoginScreenState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: '', success: false));

    try {
      // Make the API call to generate OTP using `event.phoneNumber`
      // Example:
      // Extract the digits after removing any leading zeros, "0092", or "+92"
      final phoneNumber =
          event.phoneNumber.replaceAll(RegExp(r'^(\+92|0|0092)'), '');

      // Add the prefix "92" to the phone number
      final formattedPhoneNumber = '92$phoneNumber';
      final response = await apiService.generateOTP(formattedPhoneNumber);
      print('object${response.data}');
      // Simulating API call delay for 2 seconds
      // await Future.delayed(Duration(seconds: 1));

      // Check the response and handle accordingly
      // Example:
      if (response.success) {
        emit(state.copyWith(
          isLoading: false,
          success: true,
        ));
        showToast(
            message: 'Otp sent ${response.data['data']['otp']}',
          backgroundColor: Colors.green
           );
        // ScaffoldMessenger.of(
        //         NavigatorService.navigatorKey.currentState!.context)
        //     .showSnackBar(
        //   SnackBar(
        //     content: Text(response.data['statusDescription'] ?? 'Otp sent'),
        //     backgroundColor: ColorConstant.blue600,
        //     behavior: SnackBarBehavior.floating,
        //   ),
        // );

        NavigatorService.pushNamed(
          AppRoutes.otpScreen,
          arguments: state.phoneController!.text,
        );
      } else {
        emit(state.copyWith(
            isLoading: false, success: false, error: response.error));
        showToast(
            message: response.error ?? 'An error occurred.',
            backgroundColor: Colors.red
        );

        // ScaffoldMessenger.of(
        //         NavigatorService.navigatorKey.currentState!.context)
        //     .showSnackBar(
        //   SnackBar(
        //     content: Text(response.error ?? 'An error occurred.'),
        //     backgroundColor: Colors.red,
        //     behavior: SnackBarBehavior.floating,
        //   ),
        // );
      }
    } catch (e) {
      emit(
          state.copyWith(isLoading: false, success: false, error: state.error));

      showToast(
          message: 'An unexpected error occurred. Please try again later.',
        backgroundColor: Colors.red
       );
      // ScaffoldMessenger.of(NavigatorService.navigatorKey.currentState!.context)
      //     .showSnackBar(
      //   SnackBar(
      //       content:
      //           Text('An unexpected error occurred. Please try again later.'),
      //       backgroundColor: Colors.red,
      //       behavior: SnackBarBehavior.floating,
      //       margin: EdgeInsets.only(
      //           top: MediaQuery.of(context).padding.top + kToolbarHeight)),
      // );
    }
  }

  Future<void> _resendOtp(
    ResendOTPEvent event,
    Emitter<LoginScreenState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: '', success: false));

    try {
      // Make the API call to generate OTP using `event.phoneNumber`
      // Example:
      // Extract the digits after removing any leading zeros, "0092", or "+92"
      final phoneNumber =
          event.phoneNumber.replaceAll(RegExp(r'^(\+92|0|0092)'), '');

      // Add the prefix "92" to the phone number
      final formattedPhoneNumber = '92$phoneNumber';
      final response = await apiService.generateOTP(formattedPhoneNumber);

      // Simulating API call delay for 2 seconds
      await Future.delayed(Duration(seconds: 1));

      // Check the response and handle accordingly
      // Example:
      if (response.success) {
        emit(state.copyWith(
          isLoading: false,
          success: true,
        ));

        showToast(
            message: 'Otp sent ${response.data['data']['otp']}',
            backgroundColor: Colors.green
        );
        // ScaffoldMessenger.of(
        //         NavigatorService.navigatorKey.currentState!.context)
        //     .showSnackBar(
        //   SnackBar(
        //     content: Text(response.data['statusDescription'] ?? 'Otp sent'),
        //     backgroundColor: ColorConstant.blue600,
        //     behavior: SnackBarBehavior.fixed,
        //   ),
        // );
      } else {
        emit(state.copyWith(
            isLoading: false, success: false, error: response.error));
        showToast(
            message: response.error ?? 'An error occurred.',
            backgroundColor: Colors.red
        );
        // ScaffoldMessenger.of(
        //         NavigatorService.navigatorKey.currentState!.context)
        //     .showSnackBar(
        //   SnackBar(
        //     content: Text(response.error ?? 'An error occurred.'),
        //     backgroundColor: Colors.red,
        //     behavior: SnackBarBehavior.fixed,
        //   ),
        // );
      }
    } catch (e) {
      emit(
          state.copyWith(isLoading: false, success: false, error: state.error));
      showToast(
          message: 'An unexpected error occurred. Please try again later.',
          backgroundColor: Colors.red
      );
      // ScaffoldMessenger.of(NavigatorService.navigatorKey.currentState!.context)
      //     .showSnackBar(
      //   SnackBar(
      //     content:
      //         Text('An unexpected error occurred. Please try again later.'),
      //     backgroundColor: Colors.red,
      //     behavior: SnackBarBehavior.fixed,
      //   ),
      // );
    }
  }
}
