import 'package:bloc/bloc.dart';
import 'package:clickbait_app/repositories/user_repository.dart';
import 'ranking_event.dart';
import 'ranking_state.dart';

class RankingBloc extends Bloc<RankingEvent, RankingState> {
  final UserRepository userRepository;

  RankingBloc({
    required this.userRepository,
  })  : assert(userRepository != null), super(RankingUninitialized()) {
    on<FetchRanking>((event, emit) async {
      emit(RankingLoading());
      try {
        var _rankingList = await userRepository.getRankingList();
        
        emit(
          RankingReady(
            rankingList: _rankingList,
          ),
        );
      } catch (exception) {
        emit(
          FetchRankingFailure(
            error: exception.toString(),
          ),
        );
      }
    });
  }
}
