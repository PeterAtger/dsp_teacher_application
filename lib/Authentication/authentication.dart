import 'package:http/http.dart';
import 'dart:convert';

Future<void> signInPostRequest() async {
  final url = Uri.parse('http://4cbafed19910.ngrok.io/accounts/login/');
  final headers = {"Content-type": "application/json"};
  final json = '{"username": "habibaashraf@gmail.com", "password": "Biba123"}';

  final response = await post(url, headers: headers, body: json);
  Map data = jsonDecode(response.body);
  print(data);

  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
}

Future<void> signUpPostRequest() async {
  final url = Uri.parse('http://4cbafed19910.ngrok.io/accounts/register/');
  final headers = {"Content-type": "application/json"};
  final body = {
    "first_name": "Habiba ",
    "last_name": "Khairy ",
    "email": " habibakhairy300@gmail.com",
    "password": " 12345",
    "is_teacher": true
  };

  final response = await post(url, headers: headers, body: jsonEncode(body));
  Map data = jsonDecode(response.body);
  print(data);

  print('Status code2: ${response.statusCode}');
  print('Body2: ${response.body}');
}
