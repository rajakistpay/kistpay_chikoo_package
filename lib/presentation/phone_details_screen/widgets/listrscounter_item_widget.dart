import '../models/listrscounter_item_model.dart';
import 'package:flutter/material.dart';
import 'package:kistpay_chikoo/core/app_export.dart';

// ignore: must_be_immutable
class ListrscounterItemWidget extends StatelessWidget {
  ListrscounterItemWidget(this.listrscounterItemModelObj);

  ListrscounterItemModel listrscounterItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 5,
        top: 7,
        right: 5,
        bottom: 7,
      ),
      decoration: AppDecoration.outlineGray60001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder3,
      ),
      child: Row(
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgToggleradiobu,
            height: getSize(
              10,
            ),
            width: getSize(
              10,
            ),
            margin: getMargin(
              top: 10,
              bottom: 10,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 48,
              top: 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Rs. ",
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                7.668609142303467,
                              ),
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: " ",
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                8.848394393920898,
                              ),
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_6000",
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(
                                13.27259349822998,
                              ),
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: getPadding(
                        left: 3,
                      ),
                      child: Text(
                        "per month",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMulishRomanRegular95,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: getPadding(
                    top: 2,
                  ),
                  child: Text(
                    "Over 3 months",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMulishRomanMedium1008,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
