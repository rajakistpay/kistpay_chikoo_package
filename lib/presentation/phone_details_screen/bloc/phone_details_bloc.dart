import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kistpay_chikoo/widgets/loader_dialog.dart';
import '../../../core/network/api_services.dart';
import '../finance_price.dart';
import '../models/listrscounter_item_model.dart';
import 'package:kistpay_chikoo/presentation/phone_details_screen/models/phone_details_model.dart';

import '../plans_model.dart';

part 'phone_details_event.dart';
part 'phone_details_state.dart';

class PhoneDetailsBloc extends Bloc<PhoneDetailsEvent, PhoneDetailsState> {
  final BuildContext? context;
  PhoneDetailsBloc(PhoneDetailsState initialState, {this.context}) : super(initialState) {
    on<PhoneDetailsInitialEvent>(_onInitialize);
    on<PhoneDetailsSelectRamEvent>(_onSelectRam);
    on<PhoneDetailsSelectTenureEvent>(_onSelectTenure);
    on<PhoneDetailsSelectStorageEvent>(_onSelectStorage);
    on<PhoneDetailsSelectColorEvent>(_onSelectColor);
    on<PhoneDetailsDownPaymentEvent>(_onSelectDownPayment); //_onSelectPlan
    on<PhoneDetailSelectPlansEvent>(_onSelectPlan);
    on<PhoneDetailsAddDataEvent>(_onUpdateData); //_onPreviewFinancingData
    on<PhoneDetailsPreviewPriceEvent>(_onPreviewFinancingData); //_onGetPlans
    on<GetPlansEvent>(_onGetPlans);
    on<ResetDownPayment>(_resetDown);

  }
  void  _resetDown(ResetDownPayment event,
      Emitter<PhoneDetailsState> emit){

    emit(state.copyWith(selectedTenureIndex: null,selectedDownPayment:null));
    print('objectfsdfasfsdf ${state.selectedDownPayment}');
  }
  void _onInitialize(
    PhoneDetailsInitialEvent event,
    Emitter<PhoneDetailsState> emit,
  ) async {
    // emit(state.copyWith(
    //   phoneDetailsModelObj: state.phoneDetailsModelObj,
    //   tenure: tenures(),
    // ));
    // try {
    //   emit(state.copyWith(isLoading: true));
    //
    //   // Call the API service to get all devices
    //   final apiService = ApiService();
    //   final response =
    //       await apiService.getDevicesPlans(int.parse(state.data!.price!));
    //
    //   if (response.success) {
    //     // API call successful
    //     final financingPlan = FinancingPlansResponse.fromJson(response.data);
    //     print('this is listing response ${response.data}');
    //
    //     emit(state.copyWith(
    //       financingPlan: financingPlan,
    //       isLoading: false,
    //       success: true,
    //     ));
    //   } else {
    //     // API call failed
    //     emit(state.copyWith(
    //       error: response.error!,
    //       isLoading: false,
    //       success: false,
    //     ));
    //   }
    // } catch (e) {
    //   // Error occurred
    //   print('API error: $e');
    //   emit(state.copyWith(
    //     error: 'An unexpected error occurred. Please try again later.',
    //     isLoading: false,
    //     success: false,
    //   ));
    // }
  }

  void _onGetPlans(
    GetPlansEvent event,
    Emitter<PhoneDetailsState> emit,
  ) async {
    emit(state.copyWith(
      phoneDetailsModelObj: state.phoneDetailsModelObj,
      tenure: tenures(),
    ));
    try {
      emit(state.copyWith(isLoading: true));

      // Call the API service to get all devices
      final apiService = ApiService();
      print(event.price);
      print('////');
      final response = await apiService.getDevicesPlans(event.price);
      print('this is listing response ${response.data}');
      if (response.success) {
        // API call successful
        final financingPlan = FinancingPlansResponse.fromJson(response.data);

        emit(state.copyWith(
          financingPlan: financingPlan,
          isLoading: false,
          success: true,
        ));
      } else {
        // API call failed
        emit(state.copyWith(
          error: response.error!,
          isLoading: false,
          success: false,
        ));
      }
    } catch (e) {
      // Error occurred
      print('API error: $e');
      emit(state.copyWith(
        error: 'An unexpected error occurred. Please try again later.',
        isLoading: false,
        success: false,
      ));
    }
  }

  List<ListrscounterItemModel> fillListrscounterItemList() {
    return List.generate(3, (index) => ListrscounterItemModel());
  }

  void _onSelectRam(
    PhoneDetailsSelectRamEvent event,
    Emitter<PhoneDetailsState> emit,
  ) async {
    emit(state.copyWith(selectedItemIndex: event.selectedIndex));
  }

  void _onSelectStorage(
    PhoneDetailsSelectStorageEvent event,
    Emitter<PhoneDetailsState> emit,
  ) async {
    emit(state.copyWith(selectedStorageIndex: event.selectedIndex));
  }

  void _onSelectColor(
    PhoneDetailsSelectColorEvent event,
    Emitter<PhoneDetailsState> emit,
  ) async {
    emit(state.copyWith(selectedColorIndex: event.selectedIndex));
  }

  void _onSelectTenure(
    PhoneDetailsSelectTenureEvent event,
    Emitter<PhoneDetailsState> emit,
  ) async {
    emit(state.copyWith(selectedTenureIndex: event.selectedIndex));
  }

  void _onSelectDownPayment(
    PhoneDetailsDownPaymentEvent event,
    Emitter<PhoneDetailsState> emit,
  ) async {
    emit(state.copyWith(selectedDownPayment: event.selectedIndex));
  }

  void _onSelectPlan(
    PhoneDetailSelectPlansEvent event,
    Emitter<PhoneDetailsState> emit,
  ) async {
    emit(state.copyWith(selectedPlanIndex: event.selectedIndex));
  }

  void _onUpdateData(
    PhoneDetailsAddDataEvent event,
    Emitter<PhoneDetailsState> emit,
  ) async {
    emit(state.copyWith(data: event.data));
  }

  List<Tenure> tenures() {
    return [
      Tenure("3"),
      Tenure("6"),
      Tenure("9"),
      Tenure("12"),
    ];
  }

  void _onPreviewFinancingData(
    PhoneDetailsPreviewPriceEvent event,
    Emitter<PhoneDetailsState> emit,
  ) async {
    final apiService = ApiService();
    LoadingDialog.showLoadingDialog(context: context);
    try {
      emit(state.copyWith(isLoading: true));
      // print('asdfsdsdsdas ${event.downPayment}');
      // Call the API service to get all devices

      final response = await apiService.previewInstallmentFormula(
          downPayment: event.downPayment,
          insurancePlan: event.insurancePlan,
          numberOfInstallments: event.numberOfInstallments,
          totalAmount: event.totalAmount);

      LoadingDialog.hideLoadingDialog(context: context);

      if (response.success) {
        final financingPlan = PhoneDetailsResponse.fromJson(response.data);

        emit(state.copyWith(
          phoneDetailsResponse: financingPlan,
          isLoading: false,
          success: true,
        ));
      } else {
        // API call failed
        emit(state.copyWith(
          error: response.error!,
          isLoading: false,
          success: false,
        ));
      }
    } catch (e) {
      // LoadingDialog.hideLoadingDialog();
      print(e);
      // Error occurred
      print('API error: $e');
      emit(state.copyWith(
        error: 'An unexpected error occurred. Please try again later.',
        isLoading: false,
        success: false,
      ));
    }
  }
}
