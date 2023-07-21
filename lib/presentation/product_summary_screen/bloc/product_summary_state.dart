// ignore_for_file: must_be_immutable

part of 'product_summary_bloc.dart';

class ProductSummaryState extends Equatable {
  ProductSummaryState({this.productSummaryModelObj});

  ProductSummaryModel? productSummaryModelObj;

  @override
  List<Object?> get props => [
        productSummaryModelObj,
      ];
  ProductSummaryState copyWith({ProductSummaryModel? productSummaryModelObj}) {
    return ProductSummaryState(
      productSummaryModelObj:
          productSummaryModelObj ?? this.productSummaryModelObj,
    );
  }
}
