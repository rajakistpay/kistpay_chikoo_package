import '../core/app_export.dart';

class AppRoutes {
  static const String loginScrennScreen = '/login_screnn_screen';

  static const String otpScreen = '/otp_screen';

  static const String phoneListingScreen = '/phone_listing_screen';

  static const String phoneDetailsScreen = '/phone_details_screen';

  static const String productSummaryScreen = '/product_summary_screen';

  static const String kycScreen = '/kyc_screen';

  static const String userDetailsScreen = '/user_details_screen';

  static const String termAndConditionScreen = '/term_and_condition_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';
  static const String paymentMethodScreen =
      '/paymentMethodScreen'; //FinancesPlan
  static const String financesPlan = '/FinancesPlan'; //ReferenceScreen
  static const String referenceScreen = '/ReferenceScreen'; //SuccessScreen
  static const String successScreen =
      '/SuccessScreen'; //SelectLoginOrPaymentScreen
  static const String selectLoginOrPaymentScreen =
      '/SelectLoginOrPaymentScreen'; //
  static const String authenticateScreen = '/AuthenticateScreen'; //
  static const String paymentScreen = '/PaymentScreen';

  static Map<String, WidgetBuilder> get routes => {
        loginScrennScreen: LoginScreen.builder,
        otpScreen: OtpScreen.builder,
        phoneListingScreen: PhoneListingScreen.builder,
        phoneDetailsScreen: PhoneDetailsScreen.builder,
        productSummaryScreen: ProductSummaryScreen.builder,
        kycScreen: KycScreen.builder,
        userDetailsScreen: UserDetailsScreen.builder,
        termAndConditionScreen: TermAndConditionScreen.builder,
        initialRoute: LoginScreen.builder,
        paymentMethodScreen: PaymentMethodScreen.builder,
        financesPlan: FinancesPlan.builder,
        referenceScreen: ReferenceScreen.builder,
        successScreen: SuccessScreen.builder,
        selectLoginOrPaymentScreen: SelectLoginOrPaymentScreen.builder,
        authenticateScreen: AuthenticateScreen.builder,
        paymentScreen: PaymentScreen.builder
      };
}
