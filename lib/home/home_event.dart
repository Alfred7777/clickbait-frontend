import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class CheckUserID extends HomeEvent {}

class CreateUser extends HomeEvent {
  final String username;

  const CreateUser({
    required this.username,
  });

  @override
  List<Object> get props => [username];
}

class FetchTitle extends HomeEvent {}

class SendAnswer extends HomeEvent {
  final String eventID;
  final bool? answer;

  const SendAnswer({
    required this.eventID,
    required this.answer,
  });

  @override
  List<Object> get props => [eventID];
}


