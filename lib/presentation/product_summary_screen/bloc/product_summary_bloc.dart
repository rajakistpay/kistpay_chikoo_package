import 'package:equatable/equatable.dart';

import '/core/app_export.dart';
part 'product_summary_event.dart';
part 'product_summary_state.dart';

class ProductSummaryBloc
    extends Bloc<ProductSummaryEvent, ProductSummaryState> {
  final BuildContext context;
  ProductSummaryBloc(ProductSummaryState initialState, this.context)
      : super(initialState) {
    on<ProductSummaryInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ProductSummaryInitialEvent event,
    Emitter<ProductSummaryState> emit,
  ) async {
    emit(state.copyWith(
        productSummaryModelObj: state.productSummaryModelObj
            ?.copyWith(productSummaryItemList: fillProductSummaryItemList())));
  }

  List<ProductSummaryItemModel> fillProductSummaryItemList() {
    final phoneDetailsBloc = BlocProvider.of<PhoneDetailsBloc>(context);
    return [
      ProductSummaryItemModel(
          yourselectedphoTxt: "Your selected phone",
          nameTxt: phoneDetailsBloc.state.data?.deviceName ?? '',
          id: "1"),
      ProductSummaryItemModel(
          yourselectedphoTxt: "Color", nameTxt: "Black", id: "2"),
      ProductSummaryItemModel(
          yourselectedphoTxt: "Ram and storage",
          nameTxt:
              "${phoneDetailsBloc.state.data?.ram ?? ''}, ${phoneDetailsBloc.state.data?.rom ?? ''}",
          id: "3"),
      ProductSummaryItemModel(
          yourselectedphoTxt: "Payment Mode", nameTxt: "Financing", id: "4"),

      // ProductSummaryItemModel(
      //     yourselectedphoTxt: "Down payment",
      //     nameTxt: "Rs. ${ phoneDetailsBloc.state.phoneDetailsResponse?.data?.downpayment??''} PKR (${ phoneDetailsBloc.state.selectedDownPayment??''})",
      //     id: "6"),
      // ProductSummaryItemModel(
      //     yourselectedphoTxt: "Monthly Installment",
      //     nameTxt: "Rs. ${ phoneDetailsBloc.state.phoneDetailsResponse?.data?.monthlyInstallment??''} PKR",
      //     id: "6"),
      // Add more items here with different values...
    ];
  }
}
