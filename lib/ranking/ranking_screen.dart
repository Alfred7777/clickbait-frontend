import 'package:clickbait_app/ranking/ranking_event.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickbait_app/widgets/top_bar.dart';
import 'package:clickbait_app/repositories/user_repository.dart';
import 'ranking_bloc.dart';
import 'ranking_state.dart';
import 'ranking_table.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  static const String route = '/ranking';

  @override
  State<RankingScreen> createState() => RankingScreenState();
}

class RankingScreenState extends State<RankingScreen> {
  final userRepository = UserRepository();
  late RankingBloc _rankingBloc;

  @override
  void initState() {
    super.initState();
    _rankingBloc = RankingBloc(
      userRepository: userRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    Duration _delta = const Duration(minutes: 10);
    int _now = DateTime.now().millisecondsSinceEpoch;
    DateFormat _dateFormat = DateFormat("HH:mm");

    DateTime _rankingUpdateTime = DateTime.fromMillisecondsSinceEpoch(
      _now - _now % _delta.inMilliseconds + _delta.inMilliseconds,
    );
    String _rankingUpdateTimeString = _dateFormat.format(_rankingUpdateTime);

    return LayoutBuilder(
      builder: ((context, constraints) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade800,
          body: Column(
            children: <Widget>[
              const TopBar(),
              Padding(
                padding: EdgeInsets.only(
                  top: constraints.maxWidth < 600 ? 18 : 24,
                ),
                child: Text(
                  'Kolejna aktualizacja rankingu o $_rankingUpdateTimeString',
                  style: TextStyle(
                    color: Colors.grey.shade100,
                    fontFamily: 'Poppins',
                    fontSize: constraints.maxWidth < 600 ? 14 : 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder(
                  bloc: _rankingBloc,
                  builder: (context, state) {
                    if (state is RankingUninitialized) {
                      _rankingBloc.add(FetchRanking());
                    }
                    if (state is FetchRankingFailure) {
                      return RankingTablePlaceholder(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: constraints.maxWidth < 600 ? 18 : 24,
                            horizontal: constraints.maxWidth < 600 ? 18 : 24,
                          ),
                          child: Text(
                            state.error,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade100,
                              fontFamily: 'Poppins',
                              fontSize: constraints.maxWidth < 600 ? 16 : 20,
                            ),
                          ),
                        ),
                      );
                    } else if (state is RankingReady) {
                      return RankingTable(
                        rankingList: state.rankingList,
                        userID: state.userID ?? '',
                      );
                    } else {
                      return RankingTablePlaceholder(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: constraints.maxWidth < 600 ? 18 : 24,
                            horizontal: constraints.maxWidth < 600 ? 18 : 24,
                          ),
                          child: CircularProgressIndicator(
                            color: Colors.grey.shade100,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
