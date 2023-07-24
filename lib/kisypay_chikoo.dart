library kistpay_chikoo;

import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

typedef InvokeKistpayPayment = Future<String> Function(String message);
InvokeKistpayPayment? globalCallBack;

class KistpayFinancingScreen extends StatelessWidget {
  KistpayFinancingScreen({super.key, this.invokeKistpayPayment}) {
    globalCallBack = invokeKistpayPayment;
  }
  final InvokeKistpayPayment? invokeKistpayPayment;
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
                AuthenticateBloc(const AuthenticateState(), context)
                  ..add(InitialEvent())),
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
