import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc(UserDetailsState initialState) : super(initialState) {
    on<UserDetailsInitialEvent>(_onInitialize);
    on<ChangeRadioButtonEvent>(_changeRadioButton); //_gender
    on<GenderEvent>(_gender); //_marital
    on<MaritalStatus>(_marital);
    on<FirstReference>(_firstRelationReference); //_secondRelationReference
    on<SecondReference>(_secondRelationReference);
  }

  _changeRadioButton(
    ChangeRadioButtonEvent event,
    Emitter<UserDetailsState> emit,
  ) {
    emit(state.copyWith(radioGroup: event.value));
  }

  _gender(
    GenderEvent event,
    Emitter<UserDetailsState> emit,
  ) {
    emit(state.copyWith(gender: event.value));
  }

  _marital(
    MaritalStatus event,
    Emitter<UserDetailsState> emit,
  ) {
    emit(state.copyWith(maritalStatus: event.value));
  }

  _firstRelationReference(
    FirstReference event,
    Emitter<UserDetailsState> emit,
  ) {
    emit(state.copyWith(firstReference: event.value));
  }

  _secondRelationReference(
      SecondReference event,
      Emitter<UserDetailsState> emit,
      ) {
    emit(state.copyWith(secondReference: event.value));
  }

  List<String> fillRadioList() {
    return ["Job", "Business"];
  }

  _onInitialize(
    UserDetailsInitialEvent event,
    Emitter<UserDetailsState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        cnicController: TextEditingController(),
        monthlyincomeController: TextEditingController(),
        addressController: TextEditingController(),
        firstreferenceController: TextEditingController(),
        firstreferencecController: TextEditingController(),
        secondreferenceController: TextEditingController(),
        firstreferencecController1: TextEditingController(),
        firstRelationReferenceController: TextEditingController(),
        secondRelationReferenceController: TextEditingController(),
        cityController: TextEditingController(),
        jobController: TextEditingController(),
        companyNameController: TextEditingController(),
        designationControllerController: TextEditingController(),
        radioGroup: "1"));
    emit(state.copyWith(
        userDetailsModelObj:
            state.userDetailsModelObj?.copyWith(radioList: fillRadioList())));
  }
}
