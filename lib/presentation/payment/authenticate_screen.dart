import 'package:kistpay_chikoo/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AuthenticateScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AuthenticateScreen({super.key});

  static Widget builder(BuildContext context) {
    return AuthenticateScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Container(
                        padding: getPadding(
                            left: 80, top: 66, right: 80, bottom: 66),
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
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                        padding: getPadding(left: 14, top: 35),
                        child: Text(
                            "Enter the Mobile Number to check the payment status",
                            textAlign: TextAlign.left,
                            style: AppStyle.txtMulishRomanExtraBold33)),
                    BlocSelector<AuthenticateBloc, AuthenticateState,
                            TextEditingController?>(
                        selector: (state) => state.phoneController,
                        builder: (context, phoneController) {
                          return CustomFloatingEditText(
                              controller: phoneController,
                              labelText: "Enter your phone number",
                              hintText: "03311234567",
                              textInputType:
                                  const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(14),
                              ],
                              margin: getMargin(
                                  left: 14, top: 26, right: 11, bottom: 5),
                              textInputAction: TextInputAction.done,
                              alignment: Alignment.center,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please phone number";
                                }
                                if (!isValidPhoneNumber(value!)) {
                                  return "Please enter valid phone number";
                                }
                                return null;
                              });
                        }),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: state.isLoading
            ? const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: CircularProgressIndicator(),
                  )),
                ],
              )
            : CustomButton(
                height: getVerticalSize(60),
                text: "Continue",
                margin: getMargin(left: 12, right: 13, bottom: 25),
                padding: ButtonPadding.PaddingAll18,
                onTap: () {
                  onTapContinue(context, state.phoneController?.text);
                },
              ),
      );
    });
  }

  void onTapContinue(BuildContext context, String? phoneNumber) {
    if (_formKey.currentState!.validate()) {
      // NavigatorService.pushNamed(
      //   AppRoutes.paymentScreen,
      // );

      BlocProvider.of<AuthenticateBloc>(context)
          .add(GetStatusEvent(phoneNumber));
    }
  }
}
