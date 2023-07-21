

import '../../core/app_export.dart';


class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);
  static Widget builder(BuildContext context) {
    return PaymentMethodScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Payment Method',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtMulishRomanExtraBold12Black900
                    .copyWith(color: ColorConstant.darkBlue, fontSize: 25),
              ),
              const SizedBox(
                height: 30,
              ),
              PaymentWidget(
                title: 'Easypaisa',
                image: ImageConstant.easypaisa,
                onTap: () {},
              ),
              PaymentWidget(
                title: 'JazzCash',
                onTap: () {
                  generateVoucher(
                      voucherType: 'JAZZ_CASH',
                      channelType: 'KIOSK',
                      context: context);
                },
                image: ImageConstant.jazz,
              ),
              PaymentWidget(
                title: '',
                hide: true,
                onTap: () {
                  generateVoucher(
                      voucherType: 'PAYFAST',
                      channelType: 'KIOSK',
                      context: context);
                },
              ),
              PaymentWidget(
                title: 'Debit Card',
                onTap: () {
                  easypaisaPayemnt();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> generateVoucher(
      {String? channelType, String? voucherType, BuildContext? context}) async {
    // final phoneDetailsBloc = BlocProvider.of<PhoneDetailsBloc>(context);
    final terms = BlocProvider.of<TermAndConditionBloc>(context!);
    LoadingDialog.showLoadingDialog();

    ApiService apiService = ApiService();
    try {
      final response = await apiService.generateVoucher(
          applicationId: terms.state.message,
          channelType: channelType,
          voucherType: voucherType);
      LoadingDialog.hideLoadingDialog();

      // Simulating API call delay for 2 seconds
      await Future.delayed(Duration(seconds: 1));

      // Check the response and handle accordingly
      // Example:
      if (response.success) {
        print('payemnt');
        print(response.data);
        ScaffoldMessenger.of(
                NavigatorService.navigatorKey.currentState!.context)
            .showSnackBar(
          SnackBar(
            content: Text(response.data['message'] ?? 'Application Submitted'),
            backgroundColor: ColorConstant.blue600,
            behavior: SnackBarBehavior.fixed,
          ),
        );
      } else {
        ScaffoldMessenger.of(
                NavigatorService.navigatorKey.currentState!.context)
            .showSnackBar(
          SnackBar(
            content: Text(response.error ?? 'An error occurred.'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.fixed,
          ),
        );
      }
    } catch (e) {
      LoadingDialog.hideLoadingDialog();

      ScaffoldMessenger.of(NavigatorService.navigatorKey.currentState!.context)
          .showSnackBar(
        SnackBar(
          content:
              Text('An unexpected error occurred. Please try again later.'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.fixed,
        ),
      );
    }
  }

  Future<void> easypaisaPayemnt(
      {String? amount,
      String? instalmentID,
      String? phoneNumber,
      BuildContext? context}) async {
    // final phoneDetailsBloc = BlocProvider.of<PhoneDetailsBloc>(context);
    final loginScreenBloc = BlocProvider.of<LoginScreenBloc>(context!);
    final phoneDetailsBloc = BlocProvider.of<PhoneDetailsBloc>(context);
    final terms = BlocProvider.of<TermAndConditionBloc>(context);
    LoadingDialog.showLoadingDialog();

    ApiService apiService = ApiService();
    try {
      final response = await apiService.easyPaisaPayment(
        phoneNumber: loginScreenBloc.state.phoneController?.text.trim(),
        amount:
            '${phoneDetailsBloc.state.phoneDetailsResponse?.data?.downpayment}',
        instalmentID: terms.state.message,
      );
      LoadingDialog.hideLoadingDialog();

      // Simulating API call delay for 2 seconds
      await Future.delayed(Duration(seconds: 1));

      // Check the response and handle accordingly
      // Example:
      if (response.success) {
        print('payemnt');
        ScaffoldMessenger.of(
                NavigatorService.navigatorKey.currentState!.context)
            .showSnackBar(
          SnackBar(
            content: Text(response.data['message'] ?? 'Application Submitted'),
            backgroundColor: ColorConstant.blue600,
            behavior: SnackBarBehavior.fixed,
          ),
        );
      } else {
        ScaffoldMessenger.of(
                NavigatorService.navigatorKey.currentState!.context)
            .showSnackBar(
          SnackBar(
            content: Text(response.error ?? 'An error occurred.'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.fixed,
          ),
        );
      }
    } catch (e) {
      LoadingDialog.hideLoadingDialog();

      ScaffoldMessenger.of(NavigatorService.navigatorKey.currentState!.context)
          .showSnackBar(
        SnackBar(
          content:
              Text('An unexpected error occurred. Please try again later.'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.fixed,
        ),
      );
    }
  }
}

class PaymentWidget extends StatelessWidget {
  const PaymentWidget(
      {Key? key, this.title, this.onTap, this.hide = false, this.image});
  final void Function()? onTap;
  final String? title;
  final bool hide;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!hide)
                Row(
                  children: [
                    image != null
                        ? Image.asset(image!)
                        : Icon(
                            Icons.payment,
                            size: 40,
                            color: ColorConstant.darkBlue,
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(title ?? '',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoRomanSemiBold25),
                  ],
                ),
              if (hide) Image.asset(ImageConstant.payfast),
              Container(
                height: 51,
                width: 51,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorConstant.indigo400),
                child: const Center(
                    child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
