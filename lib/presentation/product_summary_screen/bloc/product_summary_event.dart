// ignore_for_file: must_be_immutable

part of 'product_summary_bloc.dart';

@immutable
abstract class ProductSummaryEvent extends Equatable {}

class ProductSummaryInitialEvent extends ProductSummaryEvent {
  @override
  List<Object?> get props => [];
}
