import 'package:flutter/material.dart';
import 'package:clickbait_app/repositories/user_repository.dart';

class RankingTable extends StatelessWidget {
  final List<User> rankingList;

  const RankingTable({
    Key? key,
    required this.rankingList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: constraints.maxWidth < 600 ? 18 : 24,
            horizontal: constraints.maxWidth < 600 ? 18 : 24,
          ),
          child: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(
                constraints.maxWidth < 600 ? 24 : 32,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                constraints.maxWidth < 600 ? 24 : 32,
              ),
              child: RankingList(
                headerHeight: constraints.maxWidth < 600 ? 64 : 80,
                elementHeight: constraints.maxWidth < 600 ? 48 : 60,
                rankingList: rankingList,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class RankingList extends StatelessWidget {
  final double headerHeight;
  final double elementHeight;
  final List<User> rankingList;

  const RankingList({
    Key? key,
    required this.headerHeight,
    required this.elementHeight,
    required this.rankingList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RankingListHeader(
          height: headerHeight,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: rankingList.length,
            itemBuilder: (context, index) {
              return RankingListElement(
                index: index,
                user: rankingList[index],
                height: elementHeight,
              );
            },
          ),
        ),
      ],
    );
  }
}

class RankingListHeader extends StatelessWidget {
  final double height;

  const RankingListHeader({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.blueGrey.shade900,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: height,
            width: height * 1.5,
            child: Center(
              child: RankingListHeaderText(
                text: 'Pozycja',
                fontSize: height / 4,
              ),
            ),
          ),
          Expanded(
            child: RankingListHeaderText(
              text: 'Użytkownik',
              fontSize: height / 4,
            ),
          ),
          SizedBox(
            height: height,
            width: height * 1.5,
            child: Center(
              child: RankingListHeaderText(
                text: 'Punkty',
                fontSize: height / 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RankingListHeaderText extends StatelessWidget {
  final String text;
  final double fontSize;

  const RankingListHeaderText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class RankingListElement extends StatelessWidget {
  final int index;
  final User user;
  final double height;

  const RankingListElement({
    Key? key,
    required this.index,
    required this.user,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Container(
          height: height,
          color: user.userID == '0' // change for real id check
              ? Colors.lightBlue.shade900
              : index % 2 == 0
                  ? Colors.blueGrey.shade800
                  : Colors.blueGrey.shade900,
          child: Row(
            children: <Widget>[
              SizedBox(
                height: height,
                width: height * 2,
                child: Center(
                  child: RankingListElementText(
                    text: index.toString(),
                    fontSize: height / 3.6,
                  ),
                ),
              ),
              Expanded(
                child: RankingListElementText(
                  text: user.uniqueUsername,
                  fontSize: height / 3.6,
                ),
              ),
              SizedBox(
                height: height,
                width: height * 2,
                child: Center(
                  child: RankingListElementText(
                    text: user.rankingPoints.toString(),
                    fontSize: height / 3.6,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class RankingListElementText extends StatelessWidget {
  final String text;
  final double fontSize;

  const RankingListElementText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class RankingTablePlaceholder extends StatelessWidget {
  final Widget child;

  const RankingTablePlaceholder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: constraints.maxWidth < 600 ? 18 : 24,
            horizontal: constraints.maxWidth < 600 ? 18 : 24,
          ),
          child: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(
                constraints.maxWidth < 600 ? 24 : 32,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                constraints.maxWidth < 600 ? 24 : 32,
              ),
              child: Column(
                children: [
                  RankingListHeader(
                    height: constraints.maxWidth < 600 ? 64 : 80,
                  ),
                  Expanded(
                    child: Center(
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
