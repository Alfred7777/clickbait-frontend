import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<String?> getUserID() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userID = prefs.getString('userID');

    if (userID != null) {
      return userID;
    } else {
      return null;
    }
  }

  Future<void> createUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    // implement sending data to API
    if (true) {
      await prefs.setString('userID', '753gh-ghurow52-jgiotek-g28h9');
    } else {
      throw Exception('Failed to create user! Check internet connection.');
    }
  }

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
