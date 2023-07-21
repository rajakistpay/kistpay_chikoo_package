

import 'package:kistpay_chikoo/core/app_export.dart';




class ProductSummaryScreen extends StatelessWidget {
  const ProductSummaryScreen({super.key});


  static Widget builder(BuildContext context) {
    return BlocProvider<ProductSummaryBloc>(
        create: (context) => ProductSummaryBloc(
            ProductSummaryState(productSummaryModelObj: ProductSummaryModel()),context)
          ..add(ProductSummaryInitialEvent()),
        child: const ProductSummaryScreen());
  }

  @override
  Widget build(BuildContext context) {
    final phoneDetailsBloc = BlocProvider.of<PhoneDetailsBloc>(context);
    print('adsfasdfsdfsfsd${phoneDetailsBloc.state.data?.deviceName}');
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray200,
        appBar: CustomAppBar(
            height: getVerticalSize(56),
            leadingWidth: 40,
            leading: AppbarImage(
                height: getSize(24),
                width: getSize(24),
                svgPath: ImageConstant.imgArrowleftIndigo400,
                margin: getMargin(left: 16, top: 16, bottom: 16),
                onTap: () {
                  onTapArrowleft1(context);
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Selected Preferences ",),
            styleType: Style.bgFillGray5001),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(top: 17),
            child: Padding(
              padding: getPadding(left: 15, right: 16, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgRedminote11,
                      url: context
                          .select((PhoneDetailsBloc bloc) => bloc.state.data?.image),
                      height: getVerticalSize(207),
                      width: getHorizontalSize(162),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                      padding: getPadding(left: 17, top: 49, right: 17),
                      child: BlocSelector<ProductSummaryBloc,
                              ProductSummaryState, ProductSummaryModel?>(
                          selector: (state) => state.productSummaryModelObj,
                          builder: (context, productSummaryModelObj) {
                            return GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: getVerticalSize(120),
                                        crossAxisCount: 2,
                                        mainAxisSpacing: getHorizontalSize(27),
                                        crossAxisSpacing:
                                            getHorizontalSize(27)),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: productSummaryModelObj
                                        ?.productSummaryItemList.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  ProductSummaryItemModel model =
                                      productSummaryModelObj
                                              ?.productSummaryItemList[index] ??
                                          ProductSummaryItemModel();
                                  return ProductSummaryItemWidget(model);
                                });
                          })),
                ],
              ),
            ),
          ),
        ),
        // bottomNavigationBar: CustomButton(
        //   height: getVerticalSize(60),
        //   text:"Start Financing application",
        //   margin: getMargin(left: 12, right: 13, bottom: 10, top: 5),
        //   padding: ButtonPadding.PaddingAll18,
        //   onTap: () {
        //     onTapStartfinancing(context);
        //   },
        // ),
        bottomNavigationBar: CustomButton(
          height: getVerticalSize(60),
          text:"Next",
          margin: getMargin(left: 12, right: 13, bottom: 10, top: 5),
          padding: ButtonPadding.PaddingAll18,
          onTap: () {
            NavigatorService.pushNamed(
              AppRoutes.financesPlan,
            );
          },
        ),
      ),
    );
  }

  onTapStartfinancing(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.kycScreen,
    );
  }

  onTapArrowleft1(BuildContext context) {
    NavigatorService.goBack();
  }
}

