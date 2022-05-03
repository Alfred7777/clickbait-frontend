import 'package:equatable/equatable.dart';
import 'package:clickbait_app/repositories/user_repository.dart';

class RankingState extends Equatable {
  const RankingState();

  @override
  List<Object> get props => [];
}

class RankingUninitialized extends RankingState {}

class RankingLoading extends RankingState {}

class RankingReady extends RankingState {
  final List<User> rankingList;
  final String? userID;

  const RankingReady({
    required this.rankingList,
    required this.userID,
  });

  @override
  List<Object> get props => [rankingList];
}

class FetchRankingFailure extends RankingState {
  final String error;

  const FetchRankingFailure({required this.error});

  @override
  List<Object> get props => [error];
}
