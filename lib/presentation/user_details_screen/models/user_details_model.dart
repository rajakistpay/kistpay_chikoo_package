// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [user_details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class UserDetailsModel extends Equatable {
  UserDetailsModel({this.radioList = const []});

  List<String> radioList;

  UserDetailsModel copyWith({List<String>? radioList}) {
    return UserDetailsModel(
      radioList: radioList ?? this.radioList,
    );
  }

  @override
  List<Object?> get props => [radioList];
}
