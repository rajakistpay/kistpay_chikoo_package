import 'package:kistpay_chikoo/core/app_export.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  static Widget builder(BuildContext context) {
    return LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
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
                    Padding(
                      padding: getPadding(left: 14, top: 35, right: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text("Welcome to your ",
                                textAlign: TextAlign.center,
                                style: AppStyle.txtMulishRomanExtraBold33
                                    .copyWith(fontSize: 21)),
                          ),
                          Flexible(
                            child: CustomPaint(
                              painter: RPSCustomPainter(),
                              size: Size(
                                  MediaQuery.sizeOf(context).width,
                                  (MediaQuery.sizeOf(context).width * 0.15)
                                      .toDouble()),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                        padding: getPadding(left: 14, top: 35),
                        child: Text("Enter Your Mobile Number",
                            textAlign: TextAlign.left,
                            style: AppStyle.txtMulishRomanExtraBold33)),
                    Container(
                        width: getHorizontalSize(255),
                        margin: getMargin(left: 14, top: 3, right: 90),
                        child: Text(
                            "We will send you one-time password to your mobile number",
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtMulishRomanRegular1397)),
                    BlocSelector<LoginScreenBloc, LoginScreenState,
                            TextEditingController?>(
                        selector: (state) => state.phoneController,
                        builder: (context, phoneController) {
                          return CustomFloatingEditText(
                              controller: phoneController,
                              labelText: "Phone number",
                              hintText: "Enter your phone number",
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
                onTap: () async {
                  onTapContinue(context, state.phoneController?.text);
                },
              ),
      );
    });
  }

  void onTapContinue(BuildContext context, String? phoneNumber) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<LoginScreenBloc>(context)
          .add(GenerateOTPEvent(phoneNumber!));
    }
  }
}
