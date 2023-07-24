import 'package:flutter/foundation.dart';



import 'package:kistpay_chikoo/core/app_export.dart';


// ignore_for_file: must_be_immutable
class ReferenceScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ReferenceScreen({super.key});

  static Widget builder(BuildContext context) {
    return ReferenceScreen();
  }

  final FocusNode firstReferenceFocusNode = FocusNode();
  final FocusNode firstReferenceCFocusNode = FocusNode();
  final FocusNode secondReferenceFocusNode = FocusNode();
  final FocusNode secondReferenceCFocusNode = FocusNode();
  final FocusNode firstRelationReferenceFocusNode = FocusNode();
  final FocusNode secondRelationReferenceCFocusNode = FocusNode();
  final FocusNode designation = FocusNode();
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
      // resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: getPadding(left: 15, right: 15, bottom: 5, top: 20),
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
                      ],
                    ),
                  ),
                  Padding(
                      padding: getPadding(top: 31, bottom: 10),
                      child: Text(
                          "2 references for an easy process. We keep your info secure",
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMulishRomanLight16.copyWith(
                            color: const Color(0xff838383),
                          ))),
                  Padding(
                      padding: getPadding(left: 4, top: 22),
                      child: Text("References 1: ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoRomanBold15.copyWith(
                              color: ColorConstant.indigo400, fontSize: 16))),
                  const SizedBox(
                    height: 32,
                  ),
                  BlocSelector<UserDetailsBloc, UserDetailsState,
                          TextEditingController?>(
                      selector: (state) => state.firstReferenceNameController,
                      builder: (context, firstreferenceController) {
                        return CustomFloatingEditText(
                            controller: firstreferenceController,
                            labelText: "1st Reference",
                            hintText: "Enter name",
                            focusNode: firstReferenceFocusNode,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(firstReferenceCFocusNode);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your first reference name';
                              }

                              return null;
                            },
                            margin: getMargin(top: 6));
                      }),
                  BlocSelector<UserDetailsBloc, UserDetailsState,
                          TextEditingController?>(
                      selector: (state) =>
                          state.firstReferenceMobileNumberController,
                      builder: (context, firstreferencecController) {
                        return CustomFloatingEditText(
                            controller: firstreferencecController,
                            labelText: "1st reference’s contact",
                            hintText: "Enter contact number",
                            textInputType: TextInputType.number,
                            focusNode: firstReferenceCFocusNode,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(13),
                            ],
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(secondReferenceFocusNode);
                            },
                            validator: (value) {
                              if (!isValidPhoneNumber(value!)) {
                                return "Please enter valid phone number";
                              }
                              return null;
                            },
                            margin: getMargin(top: 16));
                      }),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // BlocSelector<UserDetailsBloc, UserDetailsState,
                  //         TextEditingController?>(
                  //     selector: (state) =>
                  //         state.firstRelationReferenceController,
                  //     builder: (context, firstRelationReferenceController) {
                  //       return CustomFloatingEditText(
                  //           controller: firstRelationReferenceController,
                  //           labelText: "1st Reference Relation",
                  //           hintText: "Enter relation",
                  //           focusNode: firstRelationReferenceFocusNode,
                  //           inputFormatters: [
                  //             LengthLimitingTextInputFormatter(15),
                  //           ],
                  //           onFieldSubmitted: (_) {
                  //             FocusScope.of(context)
                  //                 .requestFocus(secondReferenceFocusNode);
                  //           },
                  //           validator: (value) {
                  //             if (value!.isEmpty) {
                  //               return 'Enter your first reference relation name';
                  //             }
                  //
                  //             return null;
                  //           },
                  //           margin: getMargin(top: 6));
                  //     }),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
                          builder: (context, state) {
                            return DropdownButton<String>(
                              value: state.firstReference,
                              isExpanded: true,
                              hint: const Text(
                                'Select 1st Reference Relation',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                              onChanged: (newValue) {
                                BlocProvider.of<UserDetailsBloc>(context)
                                    .add(FirstReference(value: newValue!));
                              },
                              items: <String>[
                                'Spouse',
                                'Parent',
                                'Child',
                                'Sibling',
                                'Relative',
                                'Friend',
                                'Colleague',
                                'Employer',
                                'Other',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                      padding: getPadding(left: 4, top: 22),
                      child: Text("References 2: ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoRomanBold15.copyWith(
                              color: ColorConstant.indigo400, fontSize: 16))),
                  const SizedBox(
                    height: 32,
                  ),
                  BlocSelector<UserDetailsBloc, UserDetailsState,
                          TextEditingController?>(
                      selector: (state) => state.secondReferenceNameController,
                      builder: (context, secondreferenceController) {
                        return CustomFloatingEditText(
                            controller: secondreferenceController,
                            labelText: "2nd Reference",
                            hintText: "Enter name",
                            focusNode: secondReferenceFocusNode,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                            ],
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(secondReferenceCFocusNode);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your second reference name';
                              }

                              return null;
                            },
                            margin: getMargin(top: 16));
                      }),
                  BlocSelector<UserDetailsBloc, UserDetailsState,
                          TextEditingController?>(
                      selector: (state) =>
                          state.secondReferenceMobileNumberController,
                      builder: (context, firstreferencecController1) {
                        return CustomFloatingEditText(
                          controller: firstreferencecController1,
                          labelText: "2nd reference’s contact",
                          hintText: "Enter contact number",
                          margin: getMargin(top: 16),
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          focusNode: secondReferenceCFocusNode,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(13),
                          ],
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).unfocus();
                          },
                          validator: (value) {
                            if (!isValidPhoneNumber(value!)) {
                              return "Please enter valid phone number";
                            }
                            return null;
                          },
                        );
                      }),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // BlocSelector<UserDetailsBloc, UserDetailsState,
                  //         TextEditingController?>(
                  //     selector: (state) =>
                  //         state.secondRelationReferenceController,
                  //     builder: (context, secondRelationReferenceController) {
                  //       return CustomFloatingEditText(
                  //           controller: secondRelationReferenceController,
                  //           labelText: "2nd Reference Relation",
                  //           hintText: "Enter relation",
                  //           focusNode: secondRelationReferenceCFocusNode,
                  //           inputFormatters: [
                  //             LengthLimitingTextInputFormatter(15),
                  //           ],
                  //           onFieldSubmitted: (_) {
                  //             FocusScope.of(context).unfocus();
                  //           },
                  //           validator: (value) {
                  //             if (value!.isEmpty) {
                  //               return 'Enter your second reference relation name';
                  //             }
                  //
                  //             return null;
                  //           },
                  //           margin: getMargin(top: 6),
                  //           textInputAction: TextInputAction.done);
                  //     }),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
                          builder: (context, state) {
                            return DropdownButton<String>(
                              value: state.secondReference,
                              isExpanded: true,
                              hint: const Text(
                                'Select 2nd Reference Relation',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                              onChanged: (newValue) {
                                BlocProvider.of<UserDetailsBloc>(context)
                                    .add(SecondReference(value: newValue!));
                              },
                              items: <String>[
                                'Spouse',
                                'Parent',
                                'Child',
                                'Sibling',
                                'Relative',
                                'Friend',
                                'Colleague',
                                'Employer',
                                'Other',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                    ),
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
          if (_formKey.currentState!.validate() &&
              BlocProvider.of<UserDetailsBloc>(context).state.isValid) {
            onTapNext(context);
          } else {

              showToast(
                  message: 'Kindly select references relation', backgroundColor: Colors.red);

          }
        },
      ),
    );
  }

  onTapNext(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.termAndConditionScreen,
    );
  }
}
