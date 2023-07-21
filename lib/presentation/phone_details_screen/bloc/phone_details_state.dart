part of 'phone_details_bloc.dart';

// ignore: must_be_immutable
class PhoneDetailsState extends Equatable {
  PhoneDetailsState(
      {this.phoneDetailsModelObj,
      this.selectedItemIndex,
      this.selectedColorIndex = 0,
      this.selectedStorageIndex,
      this.selectedTenureIndex,
      this.selectedDownPayment,
      this.selectedPlanIndex = 0,
      this.data,
      this.tenure,
      this.financingPlan,
      this.error = '',
      this.success = false,
      this.isLoading = false,
      this.phoneDetailsResponse});

  PhoneListingModel? phoneDetailsModelObj;
  String? selectedItemIndex;
  String? selectedStorageIndex;
  int? selectedColorIndex;
  int? selectedTenureIndex;
  String? selectedDownPayment;
  int? selectedPlanIndex;
  MobileData? data;
  List<Tenure>? tenure;
  FinancingPlansResponse? financingPlan;
  String error;
  bool success;
  bool isLoading;
  PhoneDetailsResponse? phoneDetailsResponse;

  @override
  List<Object?> get props => [
        phoneDetailsModelObj,
        selectedItemIndex,
        selectedStorageIndex,
        selectedColorIndex,
        selectedTenureIndex,
        selectedDownPayment,
        selectedPlanIndex,
        data,
        tenure,
        financingPlan,
        error,
        success,
        isLoading,
        phoneDetailsResponse
      ];

  PhoneDetailsState copyWith({
    PhoneListingModel? phoneDetailsModelObj,
    String? selectedItemIndex,
    String? selectedStorageIndex,
    int? selectedColorIndex,
    int? selectedTenureIndex,
    String? selectedDownPayment,
    int? selectedPlanIndex,
    MobileData? data,
    List<Tenure>? tenure,
    FinancingPlansResponse? financingPlan,
    String? error,
    bool? success,
    bool? isLoading,
    PhoneDetailsResponse? phoneDetailsResponse,
  }) {
    return PhoneDetailsState(
        phoneDetailsModelObj: phoneDetailsModelObj ?? this.phoneDetailsModelObj,
        selectedItemIndex: selectedItemIndex ?? this.selectedItemIndex,
        selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
        selectedStorageIndex: selectedStorageIndex ?? this.selectedStorageIndex,
        selectedTenureIndex: selectedTenureIndex ?? this.selectedTenureIndex,
        selectedDownPayment: selectedDownPayment ?? this.selectedDownPayment,
        selectedPlanIndex: selectedPlanIndex ?? this.selectedPlanIndex,
        data: data ?? this.data,
        tenure: tenure ?? this.tenure,
        financingPlan: financingPlan ?? this.financingPlan,
        error: error ?? this.error,
        success: success ?? this.success,
        isLoading: isLoading ?? this.isLoading,
        phoneDetailsResponse:
            phoneDetailsResponse ?? this.phoneDetailsResponse);
  }


}

class Tenure {
  String? howManyMonth;
  Tenure(this.howManyMonth);
}
