// ignore_for_file: must_be_immutable
part of 'phone_listing_bloc.dart';

class PhoneListingState extends Equatable {
   PhoneListingModel? phoneListingModelObj;
   PhoneListingModel? tempPhoneListingModelObj; // Add tempPhoneListingModelObj property
  final String error;
  final bool success;
  final bool isLoading;
  final List<String> uniqueBrands;
  final int? selectedBrandIndex;

   PhoneListingState({
    this.phoneListingModelObj,
    this.tempPhoneListingModelObj, // Initialize tempPhoneListingModelObj
    this.error = '',
    this.success = false,
    this.isLoading = false,
    this.uniqueBrands = const [],
    this.selectedBrandIndex = 0,
  });

  @override
  List<Object?> get props => [
    phoneListingModelObj,
    tempPhoneListingModelObj,
    error,
    success,
    isLoading,
    uniqueBrands,
    selectedBrandIndex,
  ];

  PhoneListingState copyWith({
    PhoneListingModel? phoneListingModelObj,
    PhoneListingModel? tempPhoneListingModelObj, // Include tempPhoneListingModelObj in the copyWith method
    String? error,
    bool? success,
    bool? isLoading,
    List<String>? uniqueBrands,
    int? selectedBrandIndex,
  }) {
    return PhoneListingState(
      phoneListingModelObj: phoneListingModelObj ?? this.phoneListingModelObj,
      tempPhoneListingModelObj:
      tempPhoneListingModelObj ?? this.tempPhoneListingModelObj, // Update tempPhoneListingModelObj
      error: error ?? this.error,
      success: success ?? this.success,
      isLoading: isLoading ?? this.isLoading,
      uniqueBrands: uniqueBrands ?? this.uniqueBrands,
      selectedBrandIndex: selectedBrandIndex ?? this.selectedBrandIndex,
    );
  }
}
