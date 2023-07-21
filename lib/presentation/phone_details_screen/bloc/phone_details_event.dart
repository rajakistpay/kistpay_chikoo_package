part of 'phone_details_bloc.dart';

abstract class PhoneDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhoneDetailsInitialEvent extends PhoneDetailsEvent {

}

class PhoneDetailsSelectRamEvent extends PhoneDetailsEvent {
  final String selectedIndex;

  PhoneDetailsSelectRamEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

class PhoneDetailsSelectStorageEvent extends PhoneDetailsEvent {
  final String selectedIndex;

  PhoneDetailsSelectStorageEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

class PhoneDetailsSelectColorEvent extends PhoneDetailsEvent {
  final int selectedIndex;

  PhoneDetailsSelectColorEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

class PhoneDetailsSelectTenureEvent extends PhoneDetailsEvent {
  final int selectedIndex;

  PhoneDetailsSelectTenureEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

class PhoneDetailsDownPaymentEvent extends PhoneDetailsEvent {
  final String selectedIndex;

  PhoneDetailsDownPaymentEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

class PhoneDetailSelectPlansEvent extends PhoneDetailsEvent {
  final int selectedIndex;

  PhoneDetailSelectPlansEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

class PhoneDetailsAddDataEvent extends PhoneDetailsEvent {
  final  MobileData? data;

  PhoneDetailsAddDataEvent(this.data);

  @override
  List<Object?> get props => [data];
}
class PhoneDetailsPreviewPriceEvent extends PhoneDetailsEvent {
  final int downPayment;
  final int insurancePlan;
  final int numberOfInstallments;
  final int totalAmount;

  PhoneDetailsPreviewPriceEvent({
    required this.downPayment,
    required this.insurancePlan,
    required this.numberOfInstallments,
    required this.totalAmount,
  });

  @override
  List<Object?> get props => [downPayment, insurancePlan, numberOfInstallments, totalAmount];
}
class GetPlansEvent extends PhoneDetailsEvent {
  final String price;

  GetPlansEvent(this.price);

  @override
  List<Object?> get props => [price];
}

class ResetDownPayment extends PhoneDetailsEvent {

}
