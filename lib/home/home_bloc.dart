import 'package:bloc/bloc.dart';
import 'package:clickbait_app/repositories/user_repository.dart';
import 'package:clickbait_app/repositories/title_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;
  final TitleRepository titleRepository;

  HomeBloc({
    required this.userRepository,
    required this.titleRepository,
  }) : super(HomeUninitialized()) {
    on<CheckUserID>((event, emit) async {
      emit(HomeLoading());
      var _userID = await userRepository.getUserID();
      if (_userID != null) {
        emit(HomeAccount());
      } else {
        emit(HomeNoAccount());
      }
    });

    on<CreateUser>((event, emit) async {
      emit(HomeLoading());
      try {
        var _userID = await userRepository.createUser(event.username);
        var _title = await titleRepository.getTitle(_userID);

        emit(
          HomeReady(
            title: _title,
          ),
        );
      } catch (exception) {
        emit(
          CreateUserFailure(
            error: exception.toString(),
          ),
        );
      }
    });

    on<FetchTitle>((event, emit) async {
      emit(HomeLoading());
      try {
        var _userID = await userRepository.getUserID();
        var _title = await titleRepository.getTitle(_userID!);

        emit(
          HomeReady(
            title: _title,
          ),
        );
      } catch (exception) {
        emit(
          FetchTitleFailure(
            error: exception.toString(),
          ),
        );
      }
    });

    on<SendAnswer>((event, emit) async {
      emit(HomeLoading());
      try {
        var _userID = await userRepository.getUserID();
        if (event.answer != null) {
          titleRepository.sendAnswer(_userID!, event.eventID, event.answer!);
        }
        var _title = await titleRepository.getTitle(_userID!);

        emit(
          HomeReady(
            title: _title,
          ),
        );
      } catch (exception) {
        emit(
          FetchTitleFailure(
            error: exception.toString(),
          ),
        );
      }
    });
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
  }
}
