import 'package:kistpay_chikoo/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll18:
        return getPadding(
          all: 18,
        );
      case ButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      default:
        return getPadding(
          all: 12,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineWhiteA700_1:
        return ColorConstant.indigo400;
      case ButtonVariant.FillBlue600:
        return ColorConstant.blue600;
      case ButtonVariant.FillIndigo400:
        return ColorConstant.indigo400;
      case ButtonVariant.OutlineBluegray100:
      case ButtonVariant.OutlineRed:
        return null;
      case ButtonVariant.OutlineBlue600:
        return null;
      default:
        return ColorConstant.indigo400;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineWhiteA700_1:
        return BorderSide(
          color: ColorConstant.whiteA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBluegray100:
        return BorderSide(
          color: ColorConstant.blueGray100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineBlue600:
        return BorderSide(
          color: ColorConstant.blue600,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineRed:
        return BorderSide(
          color: ColorConstant.red500,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillBlue600:
      case ButtonVariant.FillIndigo400:
        return null;
      default:
        return BorderSide(
          color: ColorConstant.whiteA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder14:
        return BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        );
      case ButtonShape.RoundedBorder3:
        return BorderRadius.circular(
          getHorizontalSize(
            3.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.PoppinsMedium896:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            8.96,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.MulishRomanRegular1239:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            12.39,
          ),
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.MulishRomanSemiBold1239:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            12.39,
          ),
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.MulishRomanBold1256:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12.56,
          ),
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.MulishRomanMedium1196:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            11.96,
          ),
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium18:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.MulishRomanRegular18:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.MulishRomanRegularRed18:
        return TextStyle(
          color: ColorConstant.redA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder10,
  RoundedBorder14,
  RoundedBorder3,
}

enum ButtonPadding {
  PaddingAll18,
  PaddingAll6,
  PaddingAll12,
}

enum ButtonVariant {
  OutlineWhiteA700,
  OutlineWhiteA700_1,
  OutlineBluegray100,
  OutlineBlue600,
  FillBlue600,
  FillIndigo400,
  OutlineRed
}

enum ButtonFontStyle {
  PoppinsMedium15,
  PoppinsMedium896,
  MulishRomanRegular1239,
  MulishRomanSemiBold1239,
  MulishRomanBold1256,
  MulishRomanMedium1196,
  PoppinsMedium18,
  MulishRomanRegular18,
  MulishRomanRegularRed18,
}
