import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/src/services/text_input.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState(data: null));

  Future<void> signInPostRequest(String email, String password) async {
    final url = Uri.parse('http://18.193.7.235:8000/accounts/login/');
    final headers = {"Content-type": "application/json"};
    final json = jsonEncode({"username": email, "password": password});

    final response = await post(url, headers: headers, body: json);
    Map signInData = jsonDecode(response.body);
    print(signInData);

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    emit(AuthenticationState(data: signInData));
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
    Map signUpData = jsonDecode(response.body);
    print(signUpData);

    print('Status code2: ${response.statusCode}');
    print('Body2: ${response.body}');

    emit(AuthenticationState(data: signUpData));
  }
}
