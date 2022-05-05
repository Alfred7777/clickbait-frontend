import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TitleRepository {
  Future<ArticleTitle> getTitle(String userID) async {
    var uri = Uri(
      scheme: 'https',
      host: 'czytoclickbait.projektstudencki.pl',
      port: 443,
      path: '/api/title/',
    );

    var headers = {
      'Authorization': userID,
      'Content-Type': 'application/json',
    };

    try {
      var response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return ArticleTitle.fromJson(json.decode(response.body));
      } else if (response.statusCode == 204) {
        return const ArticleTitle(
          titleID: '666666',
          content: 'Oznaczyłeś wszystkie tytuły z naszej bazy danych!',
        );
      } else {
        return Future.error('Nie udało się pobrać kolejnego nagłówka!');
      }
    } catch (exception) {
      return Future.error('Błąd komunikacji z serwerem! Sprawdź połączenie.');
    }
  }

  void sendAnswer(String userID, String titleID, bool answer) async {
    var uri = Uri(
      scheme: 'https',
      host: 'czytoclickbait.projektstudencki.pl',
      port: 443,
      path: '/api/title/label',
    );

    var headers = {
      'Content-Type': 'application/json',
    };
    var body = {
      'user_id': userID,
      'title_id': titleID,
      'label': answer,
    };

    try {
      var response = await http.post(
        uri,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
      } else if (response.statusCode == 409) {
        return Future.error('Ten użytkownik już oznaczył ten tytuł!');
      } else {
        return Future.error('Nie udało się przesłać odpowiedzi!');
      }
    } catch (exception) {
      return Future.error('Błąd komunikacji z serwerem! Sprawdź połączenie.');
    }
  }
}

class ArticleTitle extends Equatable {
  final String titleID;
  final String content;

  const ArticleTitle({
    required this.titleID,
    required this.content,
  });

  factory ArticleTitle.fromJson(Map<String, dynamic> json) {
    return ArticleTitle(
      titleID: json['id'],
      content: json['content'],
    );
  }

  @override
  List<Object> get props => [
        titleID,
        content,
      ];
}
