

import 'package:equatable/equatable.dart';



import '/core/app_export.dart';

part 'kyc_event.dart';
part 'kyc_state.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  KycBloc(KycState initialState, this.context) : super(initialState) {
    on<KycInitialEvent>(_onInitialize);
    on<KycImageBackCnicCapturedEvent>(_onBackCnicImageCaptured);
    on<KycImageFrontCnicCapturedEvent>(_onFrontCnicImageCaptured);
    on<KycImageSelfieEvent>(_onSelfieImageCaptured);
    on<KycImageIncomeProofEvent>(_onIncomeProofImageCaptured);
    on<KycImageUtilityBillsEvent>(_onIncomeUtilityCaptured);
  }
  // final ApiService apiService;
  final BuildContext context;
  _onInitialize(
    KycInitialEvent event,
    Emitter<KycState> emit,
  ) async {
    emit(state.copyWith());
  }

  void _onBackCnicImageCaptured(
      KycImageBackCnicCapturedEvent event, Emitter<KycState> emit) async {
    LoadingDialog.showLoadingDialog(context: context);
    emit(state.copyWith(backCnicPath: event.imagePath));
    final ApiService apiService = ApiService();
    emit(state.copyWith(isLoading: true, error: '', success: false));
    try {
      final LoginScreenState loginState = context.read<LoginScreenBloc>().state;
      print('is this phone number ${loginState.phoneController!.text}');
      final response = await apiService.uploadFile(
          loginState.phoneController!.text, File(event.imagePath));
      // ignore: use_build_context_synchronously
      LoadingDialog.hideLoadingDialog(context: context);
      print('is this phone number ${response.data['url']}');
      if (response.success) {
        emit(state.copyWith(
            isLoading: false,
            success: true,
            backCnicImageUrl: response.data['url']));
        // ScaffoldMessenger.of(
        //         NavigatorService.navigatorKey.currentState!.context)
        //     .showSnackBar(
        //   SnackBar(
        //     content: Text(response.data['statusDescription'] ??
        //         'Image Uploaded Successfully'),
        //     backgroundColor: ColorConstant.blue600,
        //     behavior: SnackBarBehavior.fixed,
        //   ),
        // );

        showToast(
            message: response.data['statusDescription'] ??
                'Image Uploaded Successfully',
            backgroundColor: Colors.green);
      } else {
        emit(state.copyWith(
            isLoading: false, success: false, error: response.error));
        // ScaffoldMessenger.of(
        //         NavigatorService.navigatorKey.currentState!.context)
        //     .showSnackBar(
        //   SnackBar(
        //     content: Text(response.error ?? 'An error occurred.'),
        //     backgroundColor: Colors.red,
        //     behavior: SnackBarBehavior.fixed,
        //   ),
        // );
        showToast(
            message: response.error ?? 'An error occurred.',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      LoadingDialog.hideLoadingDialog(context: context);
      emit(
          state.copyWith(isLoading: false, success: false, error: state.error));
      // ScaffoldMessenger.of(NavigatorService.navigatorKey.currentState!.context)
      //     .showSnackBar(
      //   SnackBar(
      //     content:
      //         Text('An unexpected error occurred. Please try again later.'),
      //     backgroundColor: Colors.red,
      //     behavior: SnackBarBehavior.fixed,
      //   ),
      // );

      showToast(
          message: 'An unexpected error occurred. Please try again later.',
          backgroundColor: Colors.red);
    }
  }

  void _onFrontCnicImageCaptured(
      KycImageFrontCnicCapturedEvent event, Emitter<KycState> emit) async {
    LoadingDialog.showLoadingDialog(context: context);
    emit(state.copyWith(frontCnicPath: event.imagePath));
    final ApiService apiService = ApiService();
    emit(state.copyWith(isLoading: true, error: '', success: false));
    try {
      final LoginScreenState loginState = context.read<LoginScreenBloc>().state;
      print('is this phone number ${loginState.phoneController!.text}');
      final response = await apiService.uploadFile(
          loginState.phoneController!.text, File(event.imagePath));
      // ignore: use_build_context_synchronously
      LoadingDialog.hideLoadingDialog(context: context);
      print('is this phone number $response');
      if (response.success) {
        emit(state.copyWith(
            isLoading: false,
            success: true,
            fontCnicImageUrl: response.data['url']));
        showToast(
            message: response.data['statusDescription'] ??
                'Image Uploaded Successfully',
            backgroundColor: Colors.green);
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

  void _onSelfieImageCaptured(
      KycImageSelfieEvent event, Emitter<KycState> emit) async {
    LoadingDialog.showLoadingDialog(context: context);
    emit(state.copyWith(selfiePath: event.imagePath));
    final ApiService apiService = ApiService();
    emit(state.copyWith(isLoading: true, error: '', success: false));
    try {
      final LoginScreenState loginState = context.read<LoginScreenBloc>().state;
      print('is this phone number ${loginState.phoneController!.text}');
      final response = await apiService.uploadFile(
          loginState.phoneController!.text, File(event.imagePath));
      // ignore: use_build_context_synchronously
      LoadingDialog.hideLoadingDialog(context: context);
      print('is this phone number ${response.data['url']}');
      if (response.success) {
        emit(state.copyWith(
            isLoading: false, success: true, selfieUrl: response.data['url']));
        showToast(
            message: response.data['statusDescription'] ??
                'Image Uploaded Successfully',
            backgroundColor: Colors.green);
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

  void _onIncomeProofImageCaptured(
      KycImageIncomeProofEvent event, Emitter<KycState> emit) async {
    LoadingDialog.showLoadingDialog(context: context);
    emit(state.copyWith(incomeProofPath: event.imagePath));
    final ApiService apiService = ApiService();
    emit(state.copyWith(isLoading: true, error: '', success: false));
    try {
      final LoginScreenState loginState = context.read<LoginScreenBloc>().state;
      print('is this phone number ${loginState.phoneController!.text}');
      final response = await apiService.uploadFile(
          loginState.phoneController!.text, File(event.imagePath));
      // ignore: use_build_context_synchronously
      LoadingDialog.hideLoadingDialog(context: context);
      print('is this phone number ${response.data['url']}');
      if (response.success) {
        emit(state.copyWith(
            isLoading: false,
            success: true,
            incomeProofUrl: response.data['url']));
        showToast(
            message: response.data['statusDescription'] ??
                'Image Uploaded Successfully',
            backgroundColor: Colors.green);
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

  void _onIncomeUtilityCaptured(
      KycImageUtilityBillsEvent event, Emitter<KycState> emit) async {
    LoadingDialog.showLoadingDialog(context: context);
    emit(state.copyWith(utilityBills: event.imagePath));
    final ApiService apiService = ApiService();
    emit(state.copyWith(isLoading: true, error: '', success: false));
    try {
      final LoginScreenState loginState = context.read<LoginScreenBloc>().state;
      print('is this phone number ${loginState.phoneController!.text}');
      final response = await apiService.uploadFile(
          loginState.phoneController!.text, File(event.imagePath));
      // ignore: use_build_context_synchronously
      LoadingDialog.hideLoadingDialog(context: context);
      print('is this phone number ${response.data['url']}');
      if (response.success) {
        emit(state.copyWith(
            isLoading: false, success: true, utilityUrl: response.data['url']));
        showToast(
            message: response.data['statusDescription'] ??
                'Image Uploaded Successfully',
            backgroundColor: Colors.green);
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
