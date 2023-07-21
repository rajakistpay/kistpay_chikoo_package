

import 'dart:ui';

import 'package:kistpay_chikoo/core/app_export.dart';


// ignore: must_be_immutable
class FinancesPlan extends StatelessWidget {
  FinancesPlan({super.key});

  static Widget builder(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    // final phoneDetailsBloc =
    //     PhoneDetailsBloc(PhoneDetailsState(data: arguments as MobileData?));
    final phoneDetailsBloc = BlocProvider.of<PhoneDetailsBloc>(context);
    // phoneDetailsBloc.state.data = arguments as MobileData?;
    phoneDetailsBloc.add(GetPlansEvent(phoneDetailsBloc.state.data!.price!));
    phoneDetailsBloc.add(ResetDownPayment());

    return BlocProvider<PhoneDetailsBloc>.value(
      value: phoneDetailsBloc,
      child: FinancesPlan(),
    );
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    print(
        'object ${context.select((PhoneDetailsBloc bloc) => bloc.state.data!.deviceName ?? '')} dfd');
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
            height: getVerticalSize(56),
            leadingWidth: 40,
            leading: AppbarImage(
                height: getSize(24),
                width: getSize(24),
                svgPath: ImageConstant.imgArrowleftIndigo400,
                margin: getMargin(left: 16, top: 16, bottom: 16),
                onTap: () {
                  onTapArrowleft(context);
                }),
            title:
                AppbarTitle(text: "Financing Plans", margin: getMargin(left: 33)),
            styleType: Style.bgFillGray5001),
        body: SingleChildScrollView(
          padding: getPadding(top: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //txtRobotoRomanSemiBold25
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Select your preferred plan',
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRomanSemiBold25.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Your selected phone',
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRomanSemiBold25.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: BlocBuilder<PhoneDetailsBloc, PhoneDetailsState>(
                    builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '${state.data?.brand} ${state.data?.deviceName ?? ''}',
                      maxLines: null,
                      // textAlign: TextAlign.left,
                      style: AppStyle.txtMulishRomanSemiBold1494.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          color: ColorConstant.darkBlue),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                    padding: getPadding(left: 16, bottom: 10),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Rs. ",
                              style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(14.494032859802246),
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w500)),
                          TextSpan(
                            text: (context.select((PhoneDetailsBloc bloc) {
                              final discountedPrice =
                                  bloc.state.data?.discountedPrice;
                              final price = bloc.state.data?.price;

                              print("aa $discountedPrice bb $price");

                              if (discountedPrice != null &&
                                  price != null &&
                                  discountedPrice.isNotEmpty) {
                                try {
                                  final discountedPriceInt =
                                      int.parse(discountedPrice);
                                  final priceInt = int.parse(price);

                                  return (discountedPriceInt == priceInt)
                                      ? "$price"
                                      : "$discountedPrice";
                                } catch (e) {
                                  print("Parsing error: $e");
                                  // Handle the parsing error here, e.g., return a default value or an error message.
                                }
                              }

                              return "${bloc.state.data?.price}";
                            })),
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(20),
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ]),
                        textAlign: TextAlign.left)),
              ),
              if (context.select((PhoneDetailsBloc bloc) =>
                  bloc.state.data?.discountedPrice != null &&
                  bloc.state.data!.discountedPrice!.isNotEmpty &&
                  int.parse(bloc.state.data!.discountedPrice!) <
                      int.parse(bloc.state.data!.price!)))
                Padding(
                  padding: getPadding(left: 42),
                  child: Text(
                    "${context.select((PhoneDetailsBloc bloc) => bloc.state.data?.price ?? '')} PKR",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMulishRomanSemiBold1035.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
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
                padding: getPadding(left: 18, top: 20),
                child: Row(
                  children: [
                    Text("Down payment:",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMulishRomanBold1471),
                    Padding(
                      padding: getPadding(left: 5),
                      child: BlocBuilder<PhoneDetailsBloc, PhoneDetailsState>(
                        builder: (context, state) {
                          final selectedDownPayment = state.selectedDownPayment;
                          return Text(
                            selectedDownPayment != null
                                ? '$selectedDownPayment '
                                : '',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtMulishRomanSemiBold1471.copyWith(
                                color: ColorConstant.darkBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(left: 18, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                ),
                child: BlocConsumer<PhoneDetailsBloc, PhoneDetailsState>(
                    listener: (context, state) {
                  if (state.selectedTenureIndex != null) {
                    context.read<PhoneDetailsBloc>().add(
                          PhoneDetailsPreviewPriceEvent(
                            downPayment: int.parse(
                                state.selectedDownPayment!.replaceAll('%', '')),
                            insurancePlan: state.selectedTenureIndex!,
                            numberOfInstallments: state.selectedTenureIndex!,
                            totalAmount: int.parse(state.data!.price!),
                          ),
                        );
                  }
                }, listenWhen: (previous, current) {
                  return previous.selectedDownPayment !=
                      current.selectedDownPayment;
                }, builder: (context, state) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: state.selectedDownPayment,
                      hint: Text('Select an option'),
                      onChanged: (newValue) {
                        context.read<PhoneDetailsBloc>().add(
                              PhoneDetailsDownPaymentEvent(newValue!),
                            );
                      },
                      items: state.financingPlan?.data
                          ?.map<DropdownMenuItem<String>>((financingPlan) {
                        return DropdownMenuItem<String>(
                          value: financingPlan.downPayment,
                          child: Text(
                            '${financingPlan.downPayment}',
                            style: TextStyle(color: ColorConstant.blue600),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),
              ),
              Padding(
                padding: getPadding(
                    left: 18,
                    top: (context.select((PhoneDetailsBloc bloc) =>
                                bloc.state.selectedDownPayment) !=
                            null)
                        ? 20
                        : 0),
                child: Row(
                  children: [
                    if (context.select((PhoneDetailsBloc bloc) =>
                            bloc.state.selectedDownPayment) !=
                        null)
                      Text(
                        "Tenure:",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMulishRomanBold1471,
                      ),
                    if (context.select((PhoneDetailsBloc bloc) =>
                                bloc.state.selectedDownPayment) !=
                            null &&
                        context.select((PhoneDetailsBloc bloc) =>
                                bloc.state.selectedTenureIndex) !=
                            null)
                      Padding(
                        padding: getPadding(left: 5),
                        child: Text(
                          "${context.select((PhoneDetailsBloc bloc) => bloc.state.selectedTenureIndex)} Months",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMulishRomanSemiBold1471.copyWith(
                              color: ColorConstant.darkBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: BlocConsumer<PhoneDetailsBloc, PhoneDetailsState>(
                  listener: (context, state) {
                    context.read<PhoneDetailsBloc>().add(
                          PhoneDetailsPreviewPriceEvent(
                            downPayment: int.parse(
                                state.selectedDownPayment!.replaceAll('%', '')),
                            insurancePlan: state.selectedTenureIndex!,
                            numberOfInstallments: state.selectedTenureIndex!,
                            totalAmount: int.parse(state.data!.price!),
                          ),
                        );
                  },
                  listenWhen: (previous, current) {
                    return previous.selectedTenureIndex !=
                        current.selectedTenureIndex;
                  },
                  builder: (context, state) {
                    final selectedDownPayment = state.selectedDownPayment;
                    print('object $selectedDownPayment');
                    final financingPlansResponse = state.financingPlan;
                    List<String> tenures = [];
                    List<InstalmentPlan> selectedInstalments = [];

                    if (financingPlansResponse != null &&
                        financingPlansResponse.data != null) {
                      final financingPlans = financingPlansResponse.data!;
                      final selectedPlan = financingPlans.firstWhere(
                        (plan) => plan.downPayment == selectedDownPayment,
                        orElse: () => FinancingPlan(),
                      );

                      tenures = selectedPlan.tenure ?? [];
                      selectedInstalments = selectedPlan.instalmentsPlan ?? [];
                    }

                    return ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.vertical,
                      itemCount: tenures.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.read<PhoneDetailsBloc>().add(
                                  PhoneDetailsSelectTenureEvent(
                                    int.parse(tenures[index]),
                                  ),
                                );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3.6,
                            margin: getMargin(left: 18, right: 5, bottom: 15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (state.selectedTenureIndex ==
                                      int.parse(tenures[index]))
                                  ? ColorConstant.blue600
                                  : Colors.transparent,
                              border: Border.all(
                                color: (state.selectedTenureIndex ==
                                        int.parse(tenures[index]))
                                    ? ColorConstant.blue600
                                    : Colors.grey,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: (state.selectedTenureIndex !=
                                                int.parse(tenures[index]))
                                            ? ColorConstant.blue600
                                            : Colors.white,
                                      )),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Rs. ',
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .copyWith(
                                              fontSize: 14,
                                              color: (state.selectedTenureIndex ==
                                                      int.parse(tenures[index]))
                                                  ? Colors.white
                                                  : ColorConstant.darkBlue,
                                            ), // Optional: Inherit the default text style
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '${selectedInstalments[index].monthlyInstallment}',
                                            style: DefaultTextStyle.of(context)
                                                .style
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24,
                                                  color:
                                                      (state.selectedTenureIndex ==
                                                              int.parse(
                                                                  tenures[index]))
                                                          ? Colors.white
                                                          : ColorConstant
                                                              .darkBlue,
                                                ),
                                          ),
                                          TextSpan(
                                            text: ' per month',
                                            style: AppStyle.txtMulishRomanBold1484
                                                .copyWith(
                                              fontSize: 12,
                                              color: (state.selectedTenureIndex ==
                                                      int.parse(tenures[index]))
                                                  ? Colors.white
                                                  : ColorConstant.gray600,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              fontFeatures: [
                                                const FontFeature.superscripts(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Over ${tenures[index]} months",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtMulishRomanRegular1228
                                          .copyWith(
                                        fontSize: 15,
                                        color: (state.selectedTenureIndex ==
                                                int.parse(tenures[index]))
                                            ? ColorConstant.whiteA700
                                            : ColorConstant.gray600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox()
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              BlocBuilder<PhoneDetailsBloc, PhoneDetailsState>(
                builder: (context, state) {
                  final data = state.phoneDetailsResponse?.data;

                  if (data != null) {
                    return Padding(
                      padding: getPadding(left: 18, top: 20, right: 18),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildDataRow("Down Payment", "Rs. ${data.downpayment}"),
                          const SizedBox(
                            height: 5,
                          ),
                          buildDataRow("Insurance Charges",
                              "Rs. ${data.insuranceCharges!.toStringAsFixed(0)} "),
                          const SizedBox(
                            height: 5,
                          ),
                          buildDataRow("Financing Fee",
                              "Rs. ${data.financingFee!.toStringAsFixed(0)} "),
                          const SizedBox(
                            height: 15,
                          ),
                          buildDataRow(
                              "Total Upfront", "Rs. ${data.totalUpfront}"),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Including taxes',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: AppStyle.txtMulishRomanBold1471.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.gray600,
                                  fontSize: 13),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          // Add more rows for other data
                        ],
                      ),
                    );
                  } else {
                    return const Text('');
                  }
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomButton(
          height: getVerticalSize(60),
          text: "Submit",
          margin: getMargin(left: 12, right: 13, bottom: 10, top: 5),
          padding: ButtonPadding.PaddingAll18,
          onTap: () {
            final state = context.read<PhoneDetailsBloc>().state;
            if (state.selectedTenureIndex != null &&
                state.selectedDownPayment != null) {
              onTapStartfinancing(context);
            } else {
              showToast(
                  message: 'Kindly select Down Payment & Tenure ',
                  backgroundColor: Colors.red);
            }
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

  onTapArrowleft(BuildContext context) {
    NavigatorService.goBack();
  }

  Widget buildDataRow(
    String title,
    String value,
  ) {
    return Row(
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtMulishRomanBold1471.copyWith(
            fontWeight:
                title == 'Total Upfront' ? FontWeight.bold : FontWeight.w500,
            fontSize: title == 'Total Upfront'
                ? 18
                : getFontSize(
                    14.71,
                  ),
            color: title == 'Total Upfront'
                ? const Color(0xff505050)
                : ColorConstant.gray600,
          ),
        ),
        const Spacer(),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtMulishRomanBold1471.copyWith(
              fontSize: title == 'Total Upfront'
                  ? 18
                  : getFontSize(
                      14.71,
                    ),
              color: ColorConstant.darkBlue,
              fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
