import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<String> createUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    var uri = Uri(
      scheme: 'http',
      host: 'localhost',
      port: 62266,
      path: '/user/create',
    );

    var headers = {
      'Content-Type': 'application/json',
    };
    var body = {
      'username': username,
    };

    var response = await http.post(
      uri,
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 201) {
      await prefs.setString('userID', json.decode(response.body)['user_id']);
      return json.decode(response.body)['user_id'];
    } else if (response.statusCode == 409) {
      return Future.error('Nazwa użytkownika jest już zajęta!');
    } else {
      return Future.error('Nie udało się utworzyć nazwy użytkownika!');
    }
  }

  Future<List<User>> getRankingList() async {
    var uri = Uri(
      scheme: 'http',
      host: 'localhost',
      port: 62266,
      path: '/user/ranking',
    );

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var users = json.decode(response.body)['users'];
      return users.map<User>((user) => User.fromJson(user)).toList();
    } else {
      return Future.error('Nie udało się pobrać listy rankingowej!');
    }
  }
}

class User extends Equatable {
  final String userID;
  final String uniqueUsername;
  final int rankingScore;

  const User({
    required this.userID,
    required this.uniqueUsername,
    required this.rankingScore,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['user_id'],
      uniqueUsername: json['username'],
      rankingScore: json['score'],
    );
  }

  @override
  List<Object> get props => [
        userID,
        uniqueUsername,
        rankingScore,
      ];
}
