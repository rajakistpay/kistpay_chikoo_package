

import 'package:kistpay_chikoo/core/app_export.dart';



class KycScreen extends StatelessWidget {
  KycScreen({super.key});

  static Widget builder(BuildContext context) {
    final kycBloc = BlocProvider.of<KycBloc>(context);

    return BlocProvider<KycBloc>.value(
      value: kycBloc,
      child: KycScreen(),
    );
  }

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode cnicFocusNode = FocusNode();

  final FocusNode addressFocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              text: "Financing Application", margin: getMargin(left: 33)),
          styleType: Style.bgFillGray5001),
      backgroundColor: ColorConstant.gray50,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 12, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(right: 7, top: 20),
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
                                      color: ColorConstant.darkBlue,
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
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Terms & Conditions',
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
                      padding: getPadding(top: 31),
                      child: Text(
                          "Please enter the following details and  submit the documents below",
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMulishRomanLight16.copyWith(
                            color: const Color(0xff838383),
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocSelector<UserDetailsBloc, UserDetailsState,
                          TextEditingController?>(
                      selector: (state) => state.nameController,
                      builder: (context, nameController) {
                        return CustomFloatingEditText(
                            controller: nameController,
                            focusNode: nameFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(cnicFocusNode);
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            labelText: "Name",
                            hintText: "Enter name",
                            margin: getMargin(top: 10),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            });
                      }),
                  BlocSelector<UserDetailsBloc, UserDetailsState,
                          TextEditingController?>(
                      selector: (state) => state.cnicController,
                      builder: (context, cnicController) {
                        return CustomFloatingEditText(
                            controller: cnicController,
                            textInputType: TextInputType.number,
                            focusNode: cnicFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(cityFocusNode);
                            },
                            inputFormatters: [
                              PakistaniCnicInputFormatter(),
                              // FilteringTextInputFormatter.allow(
                              //     RegExp(r'[0-9]')),
                            ],
                            labelText: "CNIC",
                            hintText: "43222-xxxxxxx-x",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'CNIC cannot be empty';
                              }
                              if (value.length < 15) {
                                return 'Invalid CNIC';
                              }
                              return null;
                            },
                            margin: getMargin(top: 16));
                      }),
                  BlocSelector<UserDetailsBloc, UserDetailsState,
                          TextEditingController?>(
                      selector: (state) => state.cityController,
                      builder: (context, addressController) {
                        return CustomFloatingEditText(
                            controller: addressController,
                            labelText: "City",
                            hintText: "Enter city",
                            focusNode: cityFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(addressFocusNode);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'City is empty';
                              }

                              return null;
                            },
                            margin: getMargin(top: 16));
                      }),
                  BlocSelector<UserDetailsBloc, UserDetailsState,
                          TextEditingController?>(
                      selector: (state) => state.addressController,
                      builder: (context, addressController) {
                        return CustomFloatingEditText(
                            controller: addressController,
                            labelText: "Residential Address",
                            hintText: "Enter address",
                            focusNode: addressFocusNode,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).unfocus();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Address is empty';
                              }

                              return null;
                            },
                            margin: getMargin(top: 16));
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<KycBloc, KycState>(builder: (context, state) {
                    return UploadKycDocumentWidget(
                      title: 'CNIC front',
                      path: context.read<KycBloc>().state.frontCnicPath,
                      widget: state.frontCnicPath != null
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3.6,
                              padding: getPadding(top: 15, bottom: 15),
                              decoration:
                                  AppDecoration.outlineGray60001.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder2,
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  alignment: FractionalOffset.center,
                                  image: FileImage(File(state.frontCnicPath!)),
                                ),
                              ),
                            )
                          : Container(),
                      onTap: () async {
                        FocusScope.of(context).unfocus();

                        final imagePath = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ExampleCameraOverlay(
                              iscnic: true,
                              idCard: '',
                            ),
                          ),
                        );

                        if (imagePath != null) {
                          // ignore: use_build_context_synchronously
                          context.read<KycBloc>().add(
                              KycImageFrontCnicCapturedEvent(imagePath, ''));
                        }
                      },
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<KycBloc, KycState>(builder: (context, state) {
                    return UploadKycDocumentWidget(
                      title: 'CNIC back',
                      path: context.read<KycBloc>().state.backCnicPath,
                      widget: state.backCnicPath != null
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3.6,
                              padding: getPadding(top: 15, bottom: 15),
                              decoration:
                                  AppDecoration.outlineGray60001.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder2,
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  alignment: FractionalOffset.center,
                                  image: FileImage(File(state.backCnicPath!)),
                                ),
                              ),
                            )
                          : Container(),
                      onTap: () async {
                        final imagePath = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ExampleCameraOverlay(
                              iscnic: true,
                              idCard: '',
                            ),
                          ),
                        );

                        if (imagePath != null) {
                          // ignore: use_build_context_synchronously
                          context.read<KycBloc>().add(
                              KycImageBackCnicCapturedEvent(imagePath, ''));
                        }
                      },
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<KycBloc, KycState>(builder: (context, state) {
                    return UploadKycDocumentWidget(
                      title: 'Selfie',
                      path: context.read<KycBloc>().state.selfiePath,
                      widget: state.selfiePath != null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: AspectRatio(
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
                                      image: FileImage(File(state.selfiePath!)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      onTap: () async {
                        final imagePath = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ExampleCameraOverlay(
                              isSelfie: true,
                            ),
                          ),
                        );
                        if (imagePath != null) {
                          // ignore: use_build_context_synchronously
                          context
                              .read<KycBloc>()
                              .add(KycImageSelfieEvent(imagePath, ''));
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
          height: getVerticalSize(60),
          text: "Next",
          margin: getMargin(left: 18, right: 22, bottom: 10, top: 5),
          padding: ButtonPadding.PaddingAll18,
          fontStyle: ButtonFontStyle.PoppinsMedium18,
          onTap: () {
            onTapNext(context);
          }),
    );
  }

  onTapNext(BuildContext context) {
    final state = context.read<KycBloc>().state;
    if (_formKey.currentState!.validate() && !state.areAllImagesNull()) {
      NavigatorService.pushNamed(
        AppRoutes.userDetailsScreen,
      );
    } else {
      // final snackBar = SnackBar(
      //   backgroundColor: ColorConstant.blue600,
      //   content: const Text(
      //     'Kindly Scan all documents',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   duration: const Duration(seconds: 2),
      // );
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      showToast(
          message: 'Kindly submit all documents', backgroundColor: Colors.red);
    }
  }
}

class UploadKycDocumentWidget extends StatelessWidget {
  const UploadKycDocumentWidget(
      {super.key, this.title, this.onTap, this.widget, this.path});
  final void Function()? onTap;
  final String? title;
  final Widget? widget;
  final String? path;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title ?? '',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRobotoRomanSemiBold25.copyWith(
                          color: path != null
                              ? ColorConstant.darkBlue
                              : ColorConstant.indigo400)),
                  Container(
                    height: 51,
                    width: 51,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: path != null
                            ? Colors.green
                            : ColorConstant.indigo400),
                    child: Center(
                        child: Icon(
                      path != null ? Icons.check : Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 30,
                    )),
                  )
                ],
              ),
              if (path != null)
                const SizedBox(
                  height: 20,
                ),
              widget ?? Container()
            ],
          ),
        ),
      ),
    );
  }
}
