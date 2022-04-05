import 'package:equatable/equatable.dart';

class UserRepository {
  List<User> getRankingList() {
    // implement fetching data from API
    if (true) {
      return [
        User(
          userID: '4', 
          uniqueUsername: 'KrzysztofJarzyna', 
          rankingPoints: 480,
        ),
        User(
          userID: '1', 
          uniqueUsername: 'kotlet_schabowy', 
          rankingPoints: 460,
        ),
        User(
          userID: '0', 
          uniqueUsername: 'Alfred7777', 
          rankingPoints: 336,
        ),
        User(
          userID: '5', 
          uniqueUsername: 'ZnawcaClickbaitu', 
          rankingPoints: 288,
        ),
        User(
          userID: '3', 
          uniqueUsername: 'JoseArcadioMorales', 
          rankingPoints: 211,
        ),
        User(
          userID: '2', 
          uniqueUsername: 'siwy_bajerant', 
          rankingPoints: 10,
        ),
      ];
    } else {
      throw Exception('Failed to fetch ranking! Check internet connection.');
    }
  }
}

class User extends Equatable {
  final String userID;
  final String uniqueUsername;
  final int rankingPoints;

  const User({
    required this.userID,
    required this.uniqueUsername,
    required this.rankingPoints,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['user_id'],
      uniqueUsername: json['unique_username'],
      rankingPoints: json['ranking_points'],
    );
  }

  @override
  List<Object> get props => [
        userID,
        uniqueUsername,
        rankingPoints,
      ];
}
