import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class SubmitUserDataEvent extends AppEvent {
  final String name;
  final String password;
  final String email;
  final int gender;
  final String birthdate;

  const SubmitUserDataEvent({
    required this.name,
    required this.birthdate,
    required this.email,
    required this.gender,
    required this.password,
  });
}

class OpenLocationOnMap extends AppEvent{}

class RemoveUserEvent extends AppEvent{}

class ChangeLangEvent extends AppEvent{}
