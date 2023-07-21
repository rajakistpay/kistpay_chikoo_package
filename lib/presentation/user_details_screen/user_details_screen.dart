// ignore_for_file: must_be_immutable
import '../../core/app_export.dart';

class UserDetailsScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserDetailsScreen({super.key});

  static Widget builder(BuildContext context) {
    return UserDetailsScreen();
  }

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode cnicFocusNode = FocusNode();
  final FocusNode monthlyIncomeFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode firstReferenceFocusNode = FocusNode();
  final FocusNode firstReferenceCFocusNode = FocusNode();
  final FocusNode secondReferenceFocusNode = FocusNode();
  final FocusNode secondReferenceCFocusNode = FocusNode();
  final FocusNode firstRelationReferenceFocusNode = FocusNode();
  final FocusNode secondRelationReferenceCFocusNode = FocusNode();
  final FocusNode designation = FocusNode();
  final FocusNode company = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
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
              text: "Financing Application", margin: getMargin(left: 33)),
          styleType: Style.bgFillGray5001),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(left: 15, right: 12, bottom: 5, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(right: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Personal Info',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMulishRomanExtraBold12Black900
                                  .copyWith(
                                      color: ColorConstant.indigo400,
                                      fontSize: 13),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                                height: getVerticalSize(9),
                                width: getHorizontalSize(96),
                                decoration: BoxDecoration(
                                    color: ColorConstant.indigo400,
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(4)))),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Professional',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMulishRomanExtraBold12Black900
                                  .copyWith(
                                      color: ColorConstant.indigo400,
                                      fontSize: 13),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                                height: getVerticalSize(9),
                                width: getHorizontalSize(96),
                                decoration: BoxDecoration(
                                    color: ColorConstant.indigo400,
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(4)))),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'References',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMulishRomanExtraBold12Black900
                                  .copyWith(
                                      color: ColorConstant.blueGray100,
                                      fontSize: 13),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                                height: getVerticalSize(9),
                                width: getHorizontalSize(96),
                                decoration: BoxDecoration(
                                    color: ColorConstant.blueGray100,
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(4)))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: getPadding(top: 31, bottom: 10),
                      child: Text(
                          "Please enter the following details and  submit the documents below",
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMulishRomanLight16.copyWith(
                            color: const Color(0xff838383),
                          ))),
                  Container(
                      height: getVerticalSize(18),
                      width: getHorizontalSize(136),
                      margin: getMargin(top: 22),
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                height: getVerticalSize(16),
                                width: getHorizontalSize(136),
                                decoration: BoxDecoration(
                                    color: ColorConstant.gray5002))),
                        Align(
                            alignment: Alignment.center,
                            child: Text("Gender",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRobotoRomanBold15))
                      ])),
                  Padding(
                      padding: getPadding(left: 4, top: 17),
                      child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
                          builder: (context, state) {
                        return Row(children: [
                          CustomRadioButton(
                              text: "Male",
                              value: '1',
                              groupValue: state.gender,
                              fontStyle: RadioFontStyle.RobotoRegular16,
                              onChange: (value) {
                                context
                                    .read<UserDetailsBloc>()
                                    .add(GenderEvent(value: '1'));
                              }),
                          CustomRadioButton(
                              text: "Female",
                              value: '2',
                              groupValue: state.gender,
                              margin: getMargin(left: 48),
                              fontStyle: RadioFontStyle.RobotoRegular16,
                              onChange: (value) {
                                print(value);
                                context
                                    .read<UserDetailsBloc>()
                                    .add(GenderEvent(value: '2'));
                              })
                        ]);
                      })),
                  Container(
                      height: getVerticalSize(18),
                      width: getHorizontalSize(136),
                      margin: getMargin(top: 22),
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                height: getVerticalSize(16),
                                width: getHorizontalSize(136),
                                decoration: BoxDecoration(
                                    color: ColorConstant.gray5002))),
                        Align(
                            alignment: Alignment.center,
                            child: Text("Marital Status",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRobotoRomanBold15))
                      ])),
                  Padding(
                      padding: getPadding(left: 4, top: 17),
                      child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
                          builder: (context, state) {
                        return Row(children: [
                          CustomRadioButton(
                              text: "Single",
                              value: '1',
                              groupValue: state.maritalStatus,
                              fontStyle: RadioFontStyle.RobotoRegular16,
                              onChange: (value) {
                                context
                                    .read<UserDetailsBloc>()
                                    .add(MaritalStatus(value: '1'));
                              }),
                          CustomRadioButton(
                              text: "Married",
                              value: '2',
                              groupValue: state.maritalStatus,
                              margin: getMargin(left: 48),
                              fontStyle: RadioFontStyle.RobotoRegular16,
                              onChange: (value) {
                                print(value);
                                context
                                    .read<UserDetailsBloc>()
                                    .add(MaritalStatus(value: '2'));
                              })
                        ]);
                      })),
                  Container(
                      height: getVerticalSize(18),
                      width: getHorizontalSize(136),
                      margin: getMargin(top: 22),
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                height: getVerticalSize(16),
                                width: getHorizontalSize(136),
                                decoration: BoxDecoration(
                                    color: ColorConstant.gray5002))),
                        Align(
                            alignment: Alignment.center,
                            child: Text("Choose Profession",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRobotoRomanBold15))
                      ])),
                  Padding(
                      padding: getPadding(left: 4, top: 17),
                      child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
                          builder: (context, state) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomRadioButton(
                                  text: "Job",
                                  value: '1',
                                  groupValue: state.radioGroup,
                                  fontStyle: RadioFontStyle.RobotoRegular16,
                                  onChange: (value) {
                                    print(value);
                                    context.read<UserDetailsBloc>().add(
                                        ChangeRadioButtonEvent(value: value));
                                    }),
                              CustomRadioButton(
                                  text: "Business",
                                  value: '2',
                                  groupValue: state.radioGroup,
                                  fontStyle: RadioFontStyle.RobotoRegular16,
                                  onChange: (value) {
                                    print(value);
                                    context.read<UserDetailsBloc>().add(
                                        ChangeRadioButtonEvent(value: value));
                                  }),
                              CustomRadioButton(
                                  text: "Self Employed",
                                  value: '3',
                                  groupValue: state.radioGroup,
                                  fontStyle: RadioFontStyle.RobotoRegular16,
                                  onChange: (value) {
                                    print('check box $value');
                                    context.read<UserDetailsBloc>().add(
                                        ChangeRadioButtonEvent(value: value));
                                  }),
                            ]);
                      })),
                  BlocSelector<UserDetailsBloc, UserDetailsState,
                          TextEditingController?>(
                      selector: (state) => state.monthlyincomeController,
                      builder: (context, monthlyincomeController) {
                        return CustomFloatingEditText(
                            controller: monthlyincomeController,
                            labelText: "Monthly income (Pkr)",
                            hintText: "Enter your monthly income",
                            focusNode: monthlyIncomeFocusNode,
                            textInputType: TextInputType.number,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(company);
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              LengthLimitingTextInputFormatter(8),
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Monthly income is empty';
                              }

                              return null;
                            },
                            margin: getMargin(top: 16));
                      }),
                  BlocBuilder<UserDetailsBloc, UserDetailsState>(
                    builder: (context, state) {
                      if (state.radioGroup == '1') {
                        return BlocSelector<UserDetailsBloc, UserDetailsState,
                            TextEditingController?>(
                          selector: (state) => state.companyNameController,
                          builder: (context, companyNameController) {
                            return CustomFloatingEditText(
                              controller: companyNameController,
                              labelText: "Company",
                              hintText: "Enter your company name",
                              textInputAction: TextInputAction.next,
                              focusNode: company,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),
                              ],
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).requestFocus(designation);

                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your company name';
                                }
                                return null;
                              },
                              margin: getMargin(top: 15),
                            );
                          },
                        );
                      } else {
                        return const SizedBox
                            .shrink(); // Return an empty container if radiogroup is not '1'
                      }
                    },
                  ),
                  BlocBuilder<UserDetailsBloc, UserDetailsState>(
                    builder: (context, state) {
                      if (state.radioGroup == '1') {
                        return BlocSelector<UserDetailsBloc, UserDetailsState,
                            TextEditingController?>(
                          selector: (state) => state.designationControllerController,
                          builder: (context, designationControllerController) {
                            return CustomFloatingEditText(
                              controller: designationControllerController,
                              labelText: "Designation",
                              hintText: "Enter your designation",
                              textInputAction: TextInputAction.done,
                              focusNode: designation,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(50),
                              ],
                              onFieldSubmitted: (_) {
                                FocusScope.of(context).unfocus();
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter your designation';
                                }
                                return null;
                              },
                              margin: getMargin(top: 15),
                            );
                          },
                        );
                      } else {
                        return const SizedBox
                            .shrink(); // Return an empty container if radiogroup is not '1'
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<KycBloc, KycState>(builder: (context, state) {
                    return UploadKycDocumentWidget(
                      title: 'Utility Bill',
                      path: context.read<KycBloc>().state.utilityUrl,
                      widget: (state.utilityBills != null)
                          ? AspectRatio(
                              aspectRatio:
                                  MediaQuery.of(context).size.width / 450,
                              child: Container(
                                padding: getPadding(top: 15, bottom: 15),
                                alignment: FractionalOffset.center,
                                decoration:
                                    AppDecoration.outlineGray60001.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder2,
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    alignment: FractionalOffset.center,
                                    image: FileImage(File(state.utilityBills!)),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      onTap: () async {
                        FocusScope.of(context).unfocus();

                        final imagePath = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ExampleCameraOverlay(
                              iscnic: true,
                              idCard: 'Utility bill',
                              cnicCard: '',
                              model:
                                  CardOverlay.byFormat(OverlayFormat.cardID2),
                            ),
                          ),
                        );

                        if (imagePath != null) {
                          // ignore: use_build_context_synchronously
                          context
                              .read<KycBloc>()
                              .add(KycImageUtilityBillsEvent(imagePath, ''));
                        }
                      },
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<KycBloc, KycState>(builder: (context, state) {
                    return UploadKycDocumentWidget(
                      title: 'Salary slip/Income Proof',
                      path: context.read<KycBloc>().state.incomeProofPath,
                      widget: (state.incomeProofPath != null)
                          ? AspectRatio(
                              aspectRatio:
                                  MediaQuery.of(context).size.width / 450,
                              child: Container(
                                padding: getPadding(top: 15, bottom: 15),
                                decoration:
                                    AppDecoration.outlineGray60001.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder2,
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    alignment: FractionalOffset.center,
                                    image:
                                        FileImage(File(state.incomeProofPath!)),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      onTap: () async {
                        // controller.frontCnic?.value =
                        //     await Get.to(const ExampleCameraOverlay(
                        //   iscnic: true,
                        //   idCard: '',
                        final imagePath = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ExampleCameraOverlay(
                              iscnic: true,
                              idCard: 'Salary slip/Income Proof',
                              cnicCard: '',
                              model:
                                  CardOverlay.byFormat(OverlayFormat.cardID2),
                            ),
                          ),
                        );

                        if (imagePath != null) {
                          // ignore: use_build_context_synchronously
                          context
                              .read<KycBloc>()
                              .add(KycImageIncomeProofEvent(imagePath, ''));
                        }
                      },
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        height: getVerticalSize(60),
        text: "Next",
        margin: getMargin(left: 20, right: 20, bottom: 10, top: 5),
        padding: ButtonPadding.PaddingAll18,
        fontStyle: ButtonFontStyle.PoppinsMedium18,
        onTap: () {
          final state = context.read<KycBloc>().state;
          if (_formKey.currentState!.validate() && !state.utilityNull()) {
            onTapNext(context);
          } else {
            showToast(
                message: 'Kindly submit all documents',
                backgroundColor: Colors.red);
          }
        },
      ),
    );
  }

  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.referenceScreen,
    );
  }
}
