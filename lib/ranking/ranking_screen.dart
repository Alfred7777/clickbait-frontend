import 'package:clickbait_app/ranking/ranking_event.dart';
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
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Scaffold(
          backgroundColor: Colors.blueGrey.shade800,
          body: Column(
            children: <Widget>[
              const TopBar(),
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
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: constraints.maxWidth < 600 ? 16 : 20,
                            ),
                          ),
                        ),
                      );
                    } else if (state is RankingReady) {
                      return RankingTable(
                        rankingList: state.rankingList,
                      );
                    } else {
                      return RankingTablePlaceholder(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: constraints.maxWidth < 600 ? 18 : 24,
                            horizontal: constraints.maxWidth < 600 ? 18 : 24, 
                          ),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
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
