
import 'package:kistpay_chikoo/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SelectLoginOrPaymentScreen extends StatelessWidget {
  const SelectLoginOrPaymentScreen({super.key});

  static Widget builder(BuildContext context) {
    return const SelectLoginOrPaymentScreen();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Container(
                  padding:
                      getPadding(left: 80, top: 66, right: 80, bottom: 66),
                  decoration: BoxDecoration(
                      color: ColorConstant.blueA700,
                      borderRadius: BorderRadiusStyle.customBorderBL132),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgG10,
                          height: getVerticalSize(80),
                          width: getHorizontalSize(199))
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: getPadding(left: 14, top: 35),
                  child: Text("Select any one option",
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMulishRomanExtraBold33
                          .copyWith(color: ColorConstant.indigo400))),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  onTapContinue(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  height: 211,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Spacer(),
                          CustomImageView(
                            svgPath: ImageConstant.newApplicationIcon,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorConstant.gray600,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'New application',
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoRomanSemiBold25.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  NavigatorService.pushNamed(
                    AppRoutes.authenticateScreen,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  height: 211,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: CustomImageView(
                              svgPath: ImageConstant.paymentsIcon,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: ColorConstant.gray600,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Payments',
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoRomanSemiBold25.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomButton(
      //   height: getVerticalSize(60),
      //   text: "Continue",
      //   margin: getMargin(left: 12, right: 13, bottom: 25),
      //   padding: ButtonPadding.PaddingAll18,
      //   onTap: () {
      //     onTapContinue(context);
      //   },
      // ),
    );
  }

  void onTapContinue(
    BuildContext context,
  ) {
    NavigatorService.pushNamed(
      AppRoutes.initialRoute,
    );
  }
}
