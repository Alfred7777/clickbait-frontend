import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeUninitialized extends HomeState {}

class HomeLoading extends HomeState {}

class HomeNoAccount extends HomeState {}

class HomeAccount extends HomeState {}

class HomeReady extends HomeState {
  final String title;

  const HomeReady({
    required this.title,
  });

  @override
  List<Object> get props => [title];
}

class CreateUserFailure extends HomeState {
  final String error;

  const CreateUserFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class FetchTitleFailure extends HomeState {
  final String error;

  const FetchTitleFailure({required this.error});

  @override
  List<Object> get props => [error];
}
