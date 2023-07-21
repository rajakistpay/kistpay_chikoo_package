
import 'package:kistpay_chikoo/core/app_export.dart';

// ignore: must_be_immutable
class ProductSummaryItemWidget extends StatelessWidget {
  ProductSummaryItemWidget(this.productSummaryItemModelObj, {super.key});

  ProductSummaryItemModel productSummaryItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 9,
        top: 12,
        right: 9,
        bottom: 12,
      ),
      decoration: AppDecoration.fillGray20001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

            child: Text(
              productSummaryItemModelObj.yourselectedphoTxt,
              maxLines: null,
              textAlign: TextAlign.left,
              style: AppStyle.txtMulishRomanSemiBold1471,
            ),
          ),
          const Spacer(),
          Padding(
            padding: getPadding(
              top: 8,
              bottom: 6,
            ),
            child: Text(
              productSummaryItemModelObj.nameTxt,
              // overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtMulishRomanExtraBold1471,
            ),
          ),
        ],
      ),
    );
  }
}
