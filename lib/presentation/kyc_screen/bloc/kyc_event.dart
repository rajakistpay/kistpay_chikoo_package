// ignore_for_file: must_be_immutable

part of 'kyc_bloc.dart';

@immutable
abstract class KycEvent extends Equatable {}

class KycInitialEvent extends KycEvent {
  @override
  List<Object?> get props => [];
}

class KycImageCapturedEvent extends KycEvent {
  final String imagePath;
  final String url;

  KycImageCapturedEvent(this.imagePath, this.url);

  @override
  List<Object?> get props => [imagePath, url];
}

class KycImageBackCnicCapturedEvent extends KycEvent {
  final String imagePath;
  final String url;

  KycImageBackCnicCapturedEvent(this.imagePath, this.url);

  @override
  List<Object?> get props => [imagePath, url];
}

class KycImageFrontCnicCapturedEvent extends KycEvent {
  final String imagePath;
  final String url;

  KycImageFrontCnicCapturedEvent(this.imagePath, this.url);

  @override
  List<Object?> get props => [imagePath, url];
}

class KycImageSelfieEvent extends KycEvent {
  final String imagePath;
  final String url;

  KycImageSelfieEvent(this.imagePath, this.url);

  @override
  List<Object?> get props => [imagePath, url];
}

class KycImageIncomeProofEvent extends KycEvent {
  final String imagePath;
  final String url;

  KycImageIncomeProofEvent(this.imagePath, this.url);

  @override
  List<Object?> get props => [imagePath, url];
}

class KycImageUtilityBillsEvent extends KycEvent {
  final String imagePath;
  final String url;

  KycImageUtilityBillsEvent(this.imagePath, this.url);

  @override
  List<Object?> get props => [imagePath, url];
}
