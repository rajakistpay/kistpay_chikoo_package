// ignore_for_file: must_be_immutable

part of 'phone_listing_bloc.dart';

@immutable
abstract class PhoneListingEvent extends Equatable {}

class PhoneListingInitialEvent extends PhoneListingEvent {
  @override
  List<Object?> get props => [];
}
class SelectBrandEvent extends PhoneListingEvent {
  final int brandIndex;

  SelectBrandEvent(this.brandIndex);

  @override
  List<Object?> get props => [brandIndex];
}