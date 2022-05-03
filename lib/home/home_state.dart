import 'package:equatable/equatable.dart';
import 'package:clickbait_app/repositories/title_repository.dart';

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
  final ArticleTitle title;

  const HomeReady({
    required this.title,
  });

  @override
  List<Object> get props => [title];
}

class EndOfTheWorld extends HomeState {
  final ArticleTitle title;

  const EndOfTheWorld({
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
