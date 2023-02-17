import 'package:task8/enums/mainscreen_status_enum.dart';
import 'package:task8/model/user_model.dart';

class MainStates {
   MainStates({
    this.status =Status.initial,
    this.data = const <UserData>[],
  });
  
  final Status status;
  final List<UserData> data;

    MainStates copyWith({
    Status? status,
    List<UserData>? data,
  }) {
    return MainStates(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}