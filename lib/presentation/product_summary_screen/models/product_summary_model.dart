// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'product_summary_item_model.dart';

/// This class defines the variables used in the [product_summary_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProductSummaryModel extends Equatable {
  ProductSummaryModel({this.productSummaryItemList = const []});

  List<ProductSummaryItemModel> productSummaryItemList;

  ProductSummaryModel copyWith(
      {List<ProductSummaryItemModel>? productSummaryItemList}) {
    return ProductSummaryModel(
      productSummaryItemList:
          productSummaryItemList ?? this.productSummaryItemList,
    );
  }

  @override
  List<Object?> get props => [productSummaryItemList];
}
