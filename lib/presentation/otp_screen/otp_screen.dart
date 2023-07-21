
import 'dart:async';

import 'package:kistpay_chikoo/core/app_export.dart';



class OtpScreen extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OtpBloc>(
          create: (context) => OtpBloc(
            OtpState(otpModelObj: OtpModel()),
            context,
            ApiService(),
          )..add(OtpInitialEvent()),
        ),
        BlocProvider<LoginScreenBloc>(
            create: (context) => LoginScreenBloc(
                LoginScreenState(loginScreenModelObj: LoginScreenModel()),
                ApiService(), // P
                context // ass the ApiService instance to the bloc
                )
              ..add(LoginScrennInitialEvent())),
      ],
      child: OtpScreen(),
    );
  }

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  bool isCreatePinComplete = true;
  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 3);

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();

    startTimer();
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    if (countdownTimer != null) {
      setState(() => countdownTimer!.cancel());
    }
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(minutes: 3));
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    errorController!.close();
    countdownTimer!.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String phoneNumber =
        ModalRoute.of(context)!.settings.arguments as String;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(myDuration.inDays);
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.gray50,
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 16, right: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgUndrawconfirmed81ex1,
                            height: getVerticalSize(251),
                            width: getHorizontalSize(239),
                            margin: getMargin(left: 38)),
                        Padding(
                            padding: getPadding(left: 53, top: 61),
                            child: Text("OTP Verification",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMulishRomanBold2602)),
                        Padding(
                            padding: getPadding(left: 2, top: 26),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Enter the OTP sent to",
                                      style: TextStyle(
                                          color: ColorConstant.gray800,
                                          fontSize:
                                              getFontSize(17.349403381347656),
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: " $phoneNumber",
                                      style: TextStyle(
                                          color: ColorConstant.gray800,
                                          fontSize:
                                              getFontSize(17.349403381347656),
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w700))
                                ]),
                                textAlign: TextAlign.left)),
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 60),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 4,
                              obscureText: true,

                              // obscuringWidget: const FlutterLogo(
                              //   size: 24,
                              // ),
                              blinkWhenObscuring: true,
                              animationType: AnimationType.fade,
                              onSubmitted: (_) {
                                if (int.parse(_) == 4) {
                                  setState(() {
                                    isCreatePinComplete = false;
                                  });
                                }
                              },

                              validator: (v) {
                                if (v!.isEmpty) {
                                  return 'Enter OTP';
                                } else if (v.length != 4) {
                                  return 'Invalid OTP';
                                }
                                return null;
                              },
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(8),
                                  fieldHeight: 60,
                                  fieldWidth: 47,
                                  borderWidth: 1,
                                  errorBorderColor: Colors.red,
                                  activeColor: ColorConstant.deepPurple50000,
                                  selectedColor: Colors.transparent,
                                  inactiveColor: ColorConstant.gray700,
                                  activeFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  selectedFillColor: Colors.white),
                              cursorColor: ColorConstant.indigo400,

                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 5,
                                )
                              ],
                              onCompleted: (v) async {
                                if (v.length == 4) {
                                  final String phoneNumber =
                                      ModalRoute.of(context)!.settings.arguments
                                          as String;
                                  BlocProvider.of<OtpBloc>(context).add(
                                      OtpVerifyEvent(
                                          mobileNumber: phoneNumber,
                                          otp: int.parse(
                                              textEditingController.text)));
                                } else {}
                              },

                              onChanged: (value) {
                                if (value.length == 4) {}
                              },
                              beforeTextPaste: (text) {
                                debugPrint("Allowing to paste $text");

                                return true;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        BlocBuilder<LoginScreenBloc, LoginScreenState>(
                            builder: (context, state) {
                          if (state.isLoading) {
                            return Center(
                                child:
                                    CircularProgressIndicator()); // Show loader
                          } else {
                            return Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    if (minutes == '00') {
                                      String? phoneNumber =
                                          ModalRoute.of(context)!
                                              .settings
                                              .arguments as String;

                                      BlocProvider.of<LoginScreenBloc>(context)
                                          .add(ResendOTPEvent(phoneNumber));
                                      // phoneNumber = state.phoneController?.text;
                                      print('Working $phoneNumber');
                                      resetTimer();
                                      startTimer();
                                    } else {
                                      debugPrint('Working');
                                    }
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Didn’t you receive the OTP? Resend OTP",
                                            style: TextStyle(
                                                color: ColorConstant.gray400,
                                                fontSize: getFontSize(
                                                    15.1807279586792),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: " ",
                                            style: TextStyle(
                                                color: ColorConstant.gray800,
                                                fontSize: getFontSize(
                                                    15.1807279586792),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: minutes == '00'
                                                ? "Resend OTP"
                                                : '$minutes:$seconds',
                                            style: TextStyle(
                                                color:
                                                    ColorConstant.indigoA70001,
                                                fontSize: getFontSize(
                                                    15.1807279586792),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w400))
                                      ]),
                                      textAlign: TextAlign.left),
                                ));
                          }
                        })
                      ])),
            ),
          ),
          bottomNavigationBar:
              BlocBuilder<OtpBloc, OtpState>(builder: (context, state) {
            if (state.isLoading)
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CircularProgressIndicator(),
                  )),
                ],
              );
            else
              return CustomButton(
                height: getVerticalSize(60),
                text: "Done",
                margin: getMargin(left: 12, right: 13, bottom: 25),
                padding: ButtonPadding.PaddingAll18,
                onTap: () {
                  onTapDone(context);
                },
              );
          })),
    );
  }

  onTapDone(BuildContext context) {
    final String phoneNumber =
        ModalRoute.of(context)!.settings.arguments as String;
    if (formKey.currentState!.validate()) {
      BlocProvider.of<OtpBloc>(context).add(OtpVerifyEvent(
          mobileNumber: phoneNumber,
          otp: int.parse(textEditingController.text)));
    }
    // NavigatorService.pushNamed(
    //   AppRoutes.phoneListingScreen,
    // );
  }
}
