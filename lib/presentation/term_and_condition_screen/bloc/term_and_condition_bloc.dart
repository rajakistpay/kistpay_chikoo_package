import 'package:equatable/equatable.dart';
import 'package:kistpay_chikoo/presentation/term_and_condition_screen/SubmitApplicationModel.dart';
import '/core/app_export.dart';
part 'term_and_condition_event.dart';
part 'term_and_condition_state.dart';

class TermAndConditionBloc
    extends Bloc<TermAndConditionEvent, TermAndConditionState> {
  final BuildContext context;
  TermAndConditionBloc(TermAndConditionState initialState, this.context)
      : super(initialState) {
    on<TermAndConditionInitialEvent>(_onInitialize);
    on<SubmitApplicationEvent>(submitApplication); //submitApplication
  }

  _onInitialize(
    TermAndConditionInitialEvent event,
    Emitter<TermAndConditionState> emit,
  ) async {}

  Future<void> submitApplication(
    SubmitApplicationEvent event,
    Emitter<TermAndConditionState> emit,
  ) async {
    final phoneDetailsBloc = BlocProvider.of<PhoneDetailsBloc>(context);
    final kycBloc = BlocProvider.of<KycBloc>(context);
    final userDetailsBloc = BlocProvider.of<UserDetailsBloc>(context);
    final loginScreenBloc = BlocProvider.of<LoginScreenBloc>(context);
    LoadingDialog.showLoadingDialog(context: context);
    emit(state.copyWith(isLoading: true, error: '', success: false));
    print(
        'this is downpayment ${userDetailsBloc.state.monthlyincomeController!.text}');
    ApiService apiService = ApiService();
    try {
      // Make the API call to generate OTP using `event.phoneNumber`
      // Example:
      // Extract the digits after removing any leading zeros, "0092", or "+92"

      // Add the prefix "92" to the phone number
      final phoneNumber =
      loginScreenBloc.state.phoneController?.text.replaceAll(RegExp(r'^(\+92|0|0092)'), '');
      final reference1 = userDetailsBloc
          .state.firstReferenceMobileNumberController?.text
          .trim()
          .replaceAll(RegExp(r'^(\+92|0|0092)'), '');
      final reference2 = userDetailsBloc
          .state.secondReferenceMobileNumberController?.text
          .trim()
          .replaceAll(RegExp(r'^(\+92|0|0092)'), '');
      // Add the prefix "92" to the phone number
      final formattedPhoneNumber = '+92$phoneNumber';

      final response = await apiService.submitApplication(
          submitApplicationModelt: SubmitApplicationModel(
              address: userDetailsBloc.state.addressController?.text.trim(),
              agentId: 0,
              campaignPlanId: 1,
              cnicBackURL: kycBloc.state.backCnicImageUrl,
              cnicFrontURL: kycBloc.state.fontCnicImageUrl,
              city: userDetailsBloc.state.cityController?.text.trim(),
              sourceOfIncome: num.parse(
                  userDetailsBloc.state.radioGroup),
              monthlyIncome: num.parse(
                  userDetailsBloc.state.monthlyincomeController!.text.trim()),
              companyName: num.parse(
                  userDetailsBloc.state.radioGroup)==1?userDetailsBloc.state.companyNameController!.text.trim():'',
              designation:num.parse(
                  userDetailsBloc.state.radioGroup)==1? userDetailsBloc.state.designationControllerController!.text.trim():'',
              deviceToFinanceId:
                  phoneDetailsBloc.state.data!.devicePublicId, // mmobile id,,
              email: 'kistpay@gmail.com',
              signatureURL: '',
              downPaymentPercentage: num.tryParse(phoneDetailsBloc
                  .state.selectedDownPayment!
                  .replaceAll('%', '')),
              financingCustomer: FinancingCustomer(
                  altphoneNumber:
                  formattedPhoneNumber,
                  cnicNumber: userDetailsBloc.state.cnicController?.text.trim(),
                  name: userDetailsBloc.state.nameController?.text.trim(),
                  phoneNumber:
                  formattedPhoneNumber),
              lastPaidBillURL: kycBloc.state.utilityUrl,
              proofOfIncomeURL: kycBloc.state.incomeProofUrl,
              reference1: Reference1(
                name: userDetailsBloc.state.firstReferenceNameController?.text
                    .trim(),
                phoneNumber:
                '+92$reference1',
              ),
              reference2: Reference2(
                name: userDetailsBloc.state.firstReference!.trim(),
                phoneNumber: '+92$reference2',
              ),
              reference1Relation: userDetailsBloc.state.firstReference!.trim(),
              reference2Relation: userDetailsBloc.state.secondReference!.trim(),
              retailerCompany: 'Jazz',
              retailerPhoneNumber: '+923028669384',
              selfieImageURL: kycBloc.state.selfieUrl,
              maritalStatusId: int.parse(userDetailsBloc.state.maritalStatus),
              residentialStatusId: 1,
              gender: userDetailsBloc.state.gender));
      final response1 = await apiService.customerInstallmentPlan(

        phonePrice:
        phoneDetailsBloc.state.phoneDetailsResponse!.data!.phonePrice.toString(),
        downpayment:
        phoneDetailsBloc.state.phoneDetailsResponse!.data!.downpayment.toString(),
        installmentPeriod: phoneDetailsBloc.state.selectedTenureIndex.toString(),
        insuranceCharges:
        phoneDetailsBloc.state.phoneDetailsResponse!.data!.insuranceCharges.toString(),
        totalUpfront:
        phoneDetailsBloc.state.phoneDetailsResponse!.data!.totalUpfront.toString(),
        financingAmount:
        phoneDetailsBloc.state.phoneDetailsResponse!.data!.financingAmount.toString(),
        financingFee:
        phoneDetailsBloc.state.phoneDetailsResponse!.data!.financingFee.toString(),
        monthlyInstallment: phoneDetailsBloc
            .state.phoneDetailsResponse!.data!.monthlyInstallment.toString(),
        totalCostOfPhone:
        phoneDetailsBloc.state.phoneDetailsResponse!.data!.totalCostOfPhone.toString(),
        processingFee:
        phoneDetailsBloc.state.phoneDetailsResponse!.data!.processingFee.toString(),
      );
      LoadingDialog.hideLoadingDialog(context: context);

      // Simulating API call delay for 2 seconds

      // Check the response and handle accordingly
      // Example:
      if (response.success) {
        emit(state.copyWith(
            isLoading: false,
            success: true,
            message: response.data['message']));
        //response.data['message']
        // ScaffoldMessenger.of(
        //         NavigatorService.navigatorKey.currentState!.context)
        //     .showSnackBar(
        //   SnackBar(
        //     content: Text('Application Submitted'),
        //     backgroundColor: ColorConstant.blue600,
        //     behavior: SnackBarBehavior.fixed,
        //   ),
        // );

        showToast(
            message: 'Congrats! Mobile Application Sent. against ID:${response.data['message']}', backgroundColor: Colors.green);
        NavigatorService.pushNamed(
          AppRoutes.successScreen,
        );
      } else {
        emit(state.copyWith(
            isLoading: false, success: false, error: response.error));
        showToast(
            message: response.error ?? 'An error occurred.',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      LoadingDialog.hideLoadingDialog(context: context);
      emit(
          state.copyWith(isLoading: false, success: false, error: state.error));

      showToast(
          message: 'An unexpected error occurred. Please try again later.',
          backgroundColor: Colors.red);
    }
  }
}
