import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../core/network/api_services.dart';
import '/core/app_export.dart';
import 'package:kistpay_chikoo/presentation/phone_listing_screen/models/phone_listing_model.dart';
part 'phone_listing_event.dart';
part 'phone_listing_state.dart';

class PhoneListingBloc extends Bloc<PhoneListingEvent, PhoneListingState> {
  PhoneListingBloc(PhoneListingState initialState) : super(initialState) {
    on<PhoneListingInitialEvent>(_onInitialize);
    on<SelectBrandEvent>(_onSelectBrand);
  }

  void _onInitialize(
    PhoneListingInitialEvent event,
    Emitter<PhoneListingState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      // Call the API service to get all devices
      final apiService = ApiService();
      final response = await apiService.getDevices();

      if (response.success) {
        print('device response ${response.data}');
        // API call successful
        final phoneListingModel = PhoneListingModel.fromJson(response.data);
        emit(state.copyWith(
          tempPhoneListingModelObj: PhoneListingModel.fromJson(response.data),
        ));
        Set<String> uniqueBrands = phoneListingModel?.data
                ?.map((device) => device?.brand ?? '')
                .toSet() ??
            <String>{};

        String? selectedBrand =
            uniqueBrands.isNotEmpty ? uniqueBrands.toList()[0] : null;

        if (selectedBrand != null && phoneListingModel.data != null) {
          List<MobileData> filteredModels = phoneListingModel.data!
              .where((device) => device?.brand == selectedBrand)
              .toList();

          phoneListingModel.data = filteredModels;
        }

        emit(state.copyWith(
          phoneListingModelObj: phoneListingModel,
          uniqueBrands: uniqueBrands.toList(),
          isLoading: false,
          success: true,
        ));
        // Get unique brand names
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

  void _onSelectBrand(
    SelectBrandEvent event,
    Emitter<PhoneListingState> emit,
  ) {
    // Update the selectedBrand and selectedBrandIndex based on the clicked brand index
    final selectedBrand = state.uniqueBrands[event.brandIndex];
    print(selectedBrand);
    print(state.tempPhoneListingModelObj!.data!.length.toString());
    emit(state.copyWith(
        selectedBrandIndex: event.brandIndex,
        phoneListingModelObj: state.tempPhoneListingModelObj));


    // Additional logic if needed...

    // Update the phoneListingModelObj based on the selectedBrand
    if (state.phoneListingModelObj?.data != null) {
      final filteredModels = state.phoneListingModelObj!.data!
          .where((device) => device?.brand == selectedBrand)
          .toList();
      final updatedPhoneListingModel =
          state.phoneListingModelObj!.copyWith(data: filteredModels);
      emit(state.copyWith(phoneListingModelObj: updatedPhoneListingModel));
    }
  }
}
