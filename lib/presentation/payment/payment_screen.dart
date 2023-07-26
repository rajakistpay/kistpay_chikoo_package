import 'dart:convert';

import 'package:kistpay_chikoo/core/app_export.dart';

import '../../kisypay_chikoo.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  static Widget builder(BuildContext context) {
    final phoneDetailsBloc = BlocProvider.of<AuthenticateBloc>(context);
    return BlocProvider<AuthenticateBloc>.value(
      value: phoneDetailsBloc,
      child: const PaymentScreen(),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          height: getVerticalSize(56),
          leadingWidth: 40,
          leading: AppbarImage(
              height: getSize(24),
              width: getSize(24),
              svgPath: ImageConstant.imgArrowleftIndigo400,
              margin: getMargin(left: 16, top: 16, bottom: 16),
              onTap: () {
                NavigatorService.goBack();
              }),
          title: AppbarTitle(
            text: "Payments",
          ),
          styleType: Style.bgFillGray5001),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  "Application ID: ${context.read<AuthenticateBloc>().state.data['data']['publicId']}",
                  style:
                      AppStyle.txtMulishRomanExtraBold20.copyWith(fontSize: 25),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Container(
                // padding: const EdgeInsets.fromLTRB(10, 12, 10, 10),
                decoration: BoxDecoration(
                  color: ColorConstant.gray5001,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstant.black90033,
                      spreadRadius: getHorizontalSize(
                        1,
                      ),
                      blurRadius: getHorizontalSize(
                        1,
                      ),
                      offset: const Offset(
                        0,
                        1,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          color: ColorConstant.whiteA700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Container(
                            height: getSize(99),
                            width: getSize(99),
                            padding: const EdgeInsets.all(10),
                            decoration:
                                AppDecoration.outlineBlack900331.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10,
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgImage57,
                              url:
                                  '${context.read<AuthenticateBloc>().state.data['data']['deviceToFinance']['image']}',
                              height: getSize(78),
                              width: getSize(78),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${context.read<AuthenticateBloc>().state.data['data']['deviceToFinance']['deviceName']}',
                                style: AppStyle.txtMulishRomanExtraBold16,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${context.read<AuthenticateBloc>().state.data['data']['deviceToFinance']['ram']} RAM ${context.read<AuthenticateBloc>().state.data['data']['deviceToFinance']['rom']} ROM',
                                style: AppStyle.txtMulishRomanMedium12Gray800,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'PKR ${context.read<AuthenticateBloc>().state.data['data']['deviceToFinance']['price']}',
                                style: AppStyle.txtMulishRomanBold14,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Name: ${context.read<AuthenticateBloc>().state.data['data']['financingCustomer']['name']}",
                style:
                    AppStyle.txtMulishRomanExtraBold20.copyWith(fontSize: 25),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                context.read<AuthenticateBloc>().state.data['data']
                            ["financingInstalment"]['instalmentNumber'] ==
                        0
                    ? "Down payment"
                    : 'Installment',
                style: AppStyle.txtMulishRomanExtraBold20
                    .copyWith(fontSize: 20, color: ColorConstant.indigo400),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorConstant.gray600.withOpacity(0.1),
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  context
                                                      .read<AuthenticateBloc>()
                                                      .state
                                                      .data['data']
                                                  ["financingInstalment"]
                                              ['instalmentNumber'] ==
                                          0
                                      ? "Down payment"
                                      : '${context.read<AuthenticateBloc>().state.data['data']["financingInstalment"]['instalmentNumber']} Installment',
                                  style: AppStyle.txtMulishRomanExtraBold20
                                      .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Due Date",
                                  style: AppStyle.txtMulishRomanExtraBold20
                                      .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  formatDate(DateTime.parse(context
                                          .read<AuthenticateBloc>()
                                          .state
                                          .data['data']["financingInstalment"]
                                      ['instalmentDueDate'])),
                                  style: AppStyle.txtMulishRomanExtraBold20
                                      .copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, left: 8, right: 8),
                                child: Text(
                                  'PKR ${context.read<AuthenticateBloc>().state.data['data']["financingInstalment"]['amount']}',
                                  style: AppStyle.txtMulishRomanExtraBold20
                                      .copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Spacer(),

                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, left: 8, right: 8),
                                child: Text(
                                  context
                                                      .read<AuthenticateBloc>()
                                                      .state
                                                      .data['data']
                                                  ["financingInstalment"]
                                              ['instalmentNumber'] ==
                                          0
                                      ? "Down payment"
                                      : 'Installment',
                                  style: AppStyle.txtMulishRomanExtraBold20
                                      .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              height: getVerticalSize(60),
              text: "Payment",
              margin: getMargin(left: 12, right: 13, bottom: 25),
              padding: ButtonPadding.PaddingAll18,
              onTap: () async {
                if (globalCallBack != null) {
                  dynamic data = {
                    'txnAmount': context
                        .read<AuthenticateBloc>()
                        .state
                        .data['data']["financingInstalment"]['amount'],
                    'txnDateTime': DateTime.now().toString(),
                    'txnCurrency': 'PKR',
                    'invNumber': context
                        .read<AuthenticateBloc>()
                        .state
                        .data['data']['publicId'],
                    'txnType': 'SALE'
                  };
                  final response = await globalCallBack!(jsonEncode(data));
                  print('got response from consuming app$response');
                  dynamic decodedResponse = jsonDecode(response);
                  if (decodedResponse['code'] == '0000') {
                    if (context.mounted) {
                      BlocProvider.of<AuthenticateBloc>(context).add(
                          MarkPaymentEvent(
                              context
                                  .read<AuthenticateBloc>()
                                  .state
                                  .data['data']['publicId'],
                              response,
                              context
                                      .read<AuthenticateBloc>()
                                      .state
                                      .data['data']["financingInstalment"]
                                  ['instalmentNumber']));
                    }
                  }
                  else{
                    showMessageBasedOnStatusCode(decodedResponse['code']);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void showMessageBasedOnStatusCode(int statusCode) {
    switch (statusCode) {
      case 0001:
        showToast(message: 'Validation failed.', backgroundColor: Colors.red);
        break;
      case 0002:
        showToast(message: 'MID or TID not configured.', backgroundColor: Colors.red);
        break;
      case 0003:
        showToast(message: 'Unauthorized transaction.', backgroundColor: Colors.red);
        break;
      case 0004:
        showToast(message: 'Invalid message type.', backgroundColor: Colors.red);
        break;
      case 9999:
        showToast(message: 'Something went wrong.', backgroundColor: Colors.red);
        break;
      default:
        showToast(message: 'Unknown status code.', backgroundColor: Colors.red);
        break;
    }
  }
  onTapImgArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  String formatDate(DateTime dateTime) {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    String day = dateTime.day.toString().padLeft(2, '0');
    String month = months[dateTime.month - 1];
    String year = dateTime.year.toString().substring(2);

    return '$day $month $year';
  }
}
