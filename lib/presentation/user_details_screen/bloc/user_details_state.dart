// ignore_for_file: must_be_immutable

part of 'user_details_bloc.dart';

class UserDetailsState extends Equatable {
  UserDetailsState(
      {this.nameController,
      this.cnicController,
      this.monthlyincomeController,
      this.addressController,
      this.firstReferenceNameController,
      this.firstReferenceMobileNumberController,
      this.secondReferenceNameController,
      this.secondReferenceMobileNumberController,
      this.radioGroup = "1",
      this.userDetailsModelObj,
      this.firstRelationReferenceController,
      this.secondRelationReferenceController,
      this.cityController,
      this.companyNameController,
      this.designationControllerController,
      this.gender = '1',
      this.maritalStatus = '1',
      this.jobController,
      this.firstReference,
      this.secondReference});

  TextEditingController? nameController;

  TextEditingController? cnicController;

  TextEditingController? monthlyincomeController;

  TextEditingController? addressController;

  TextEditingController? firstReferenceNameController;

  TextEditingController? firstReferenceMobileNumberController;

  TextEditingController? secondReferenceNameController;

  TextEditingController? secondReferenceMobileNumberController;

  TextEditingController? firstRelationReferenceController;

  TextEditingController? secondRelationReferenceController;

  TextEditingController? companyNameController;

  TextEditingController? designationControllerController;

  TextEditingController? jobController;

  UserDetailsModel? userDetailsModelObj;

  String radioGroup;
  String gender;
  String maritalStatus;
  String? firstReference;
  String? secondReference;
  TextEditingController? cityController;
  @override
  List<Object?> get props => [
        nameController,
        cnicController,
        monthlyincomeController,
        addressController,
        firstReferenceNameController,
        firstReferenceMobileNumberController,
        secondReferenceNameController,
        secondReferenceMobileNumberController,
        radioGroup,
        userDetailsModelObj,
        firstRelationReferenceController,
        secondRelationReferenceController,
        cityController,
        companyNameController,
        designationControllerController,
        gender,
        maritalStatus,
        jobController,
        firstReference,
        secondReference,

      ];
  UserDetailsState copyWith(
      {TextEditingController? nameController,
      TextEditingController? cnicController,
      TextEditingController? monthlyincomeController,
      TextEditingController? addressController,
      TextEditingController? firstreferenceController,
      TextEditingController? firstreferencecController,
      TextEditingController? secondreferenceController,
      TextEditingController? firstreferencecController1,
      String? radioGroup,
      UserDetailsModel? userDetailsModelObj,
      TextEditingController? firstRelationReferenceController,
      TextEditingController? secondRelationReferenceController,
      TextEditingController? cityController,
      String? gender,
      String? maritalStatus,
      TextEditingController? jobController,
      String? firstReference,
      String? secondReference,TextEditingController? companyNameController,TextEditingController? designationControllerController}) {
    return UserDetailsState(
        nameController: nameController ?? this.nameController,
        cnicController: cnicController ?? this.cnicController,
        monthlyincomeController:
            monthlyincomeController ?? this.monthlyincomeController,
        addressController: addressController ?? this.addressController,
        firstReferenceNameController:
            firstreferenceController ?? firstReferenceNameController,
        firstReferenceMobileNumberController:
            firstreferencecController ?? firstReferenceMobileNumberController,
        secondReferenceNameController:
            secondreferenceController ?? secondReferenceNameController,
        secondReferenceMobileNumberController:
            firstreferencecController1 ?? secondReferenceMobileNumberController,
        radioGroup: radioGroup ?? this.radioGroup,
        userDetailsModelObj: userDetailsModelObj ?? this.userDetailsModelObj,
        firstRelationReferenceController: firstRelationReferenceController ??
            this.firstRelationReferenceController,
        secondRelationReferenceController: secondRelationReferenceController ??
            this.secondRelationReferenceController,
        cityController: cityController ?? this.cityController,
        gender: gender ?? this.gender,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        jobController: jobController ?? this.jobController,
        firstReference: firstReference ?? this.firstReference,
        companyNameController: companyNameController??this.companyNameController,
        secondReference: secondReference ?? this.secondReference,
        designationControllerController: designationControllerController??this.designationControllerController


    );
  }

  bool get isValid {
    return firstReference != null && secondReference != null;
  }
}
