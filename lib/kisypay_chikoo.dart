library kistpay_chikoo;


import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

typedef InvokeKistPayPayment = Future<String> Function(String message);
InvokeKistPayPayment? messageCallback;

// Global function to invoke the callback
// String sendMessageAndReceiveResponse(String message) {
//   if (messageCallback != null) {
//     // Invoke the callback function with the message from the payment screen
//     String response = messageCallback!(message);
//
//     // Handle the response received from the consuming app
//     // Do something with the response if needed
//     return 'Received response in Payment Screen: $response';
//   }
//
//   return '';
//
// }
// Callback variable to hold the function reference
//  InvokeKistPayPayment? messageCallback;
//  myPackageMethod(InvokeKistPayPayment? callback) {
//   // Invoke the callback function with a message
//   if (callback != null) {
//     String message = 'Hello from your package!';
//     String result = callback(message);
//     // Do something with the result if needed
//     print(result);
//   }
// }

class KistpayFinancingScreen extends StatelessWidget {
  const KistpayFinancingScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginScreenBloc>(
          create: (context1) => LoginScreenBloc(
            LoginScreenState(loginScreenModelObj: LoginScreenModel()),
            ApiService(),
            context,
          )..add(LoginScrennInitialEvent()),
        ),
        BlocProvider<KycBloc>(
          create: (context) =>
              KycBloc(KycState(kycModelObj: KycModel()), context)
                ..add(KycInitialEvent()),
        ),
        BlocProvider<PhoneDetailsBloc>(
          create: (context) =>
              PhoneDetailsBloc(PhoneDetailsState(), context: context)
                ..add(PhoneDetailsInitialEvent()),
        ),
        BlocProvider<UserDetailsBloc>(
          create: (context) => UserDetailsBloc(
              UserDetailsState(userDetailsModelObj: UserDetailsModel()))
            ..add(UserDetailsInitialEvent()),
        ),
        BlocProvider<TermAndConditionBloc>(
            create: (context) => TermAndConditionBloc(
                TermAndConditionState(
                  termAndConditionModelObj: TermAndConditionModel(),
                ),
                context)
              ..add(TermAndConditionInitialEvent())),
        BlocProvider<AuthenticateBloc>(
            create: (context) =>
                AuthenticateBloc(const AuthenticateState(),context)..add(InitialEvent())),
      ],
      child: MaterialApp(
        navigatorKey: NavigatorService.navigatorKey,
        debugShowCheckedModeBanner: false,

        scaffoldMessengerKey: globalMessengerKey,
        //for setting localization strings
        theme: ThemeData(
          // Set the status bar color here
          primaryColor: ColorConstant.blueA700,
          // Add more theme configurations as needed
          // ...
        ),
        title: 'Kistpay',
        initialRoute: AppRoutes.selectLoginOrPaymentScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
