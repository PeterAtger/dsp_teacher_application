import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/repositries/profile_data/profile_data.dart';
import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
import 'package:http/http.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState(data: null, code: null));
  int expertise;

  Future<void> signInPostRequest(String email, String password) async {
    final url = Uri.parse('http://34.132.143.59:8000/accounts/login/');
    final headers = {"Content-type": "application/json"};
    final json = jsonEncode({"username": email, "password": password});

    final response = await post(url, headers: headers, body: json);
    Map signInData = jsonDecode(response.body);
    print(signInData);

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    int code1 = response.statusCode;

    if (signInData.containsKey('token')) {
      Tokens.signInToken = signInData['token'];
      ProfileData.getProfileInfo();
    }

    emit(AuthenticationState(data: signInData, code: code1));
  }

  Future<void> signUpPostRequest(
      String fullName, String email2, String password2) async {
    final url =
        Uri.parse('http://34.132.143.59:8000/accounts/register/teacher/');
    final headers = {"Content-type": "application/json"};
    final body = {
      "full_name": fullName,
      "email": email2,
      "password": password2,
      "expertise": expertise
    };

    final response = await post(url, headers: headers, body: jsonEncode(body));
    Map signUpData = jsonDecode(response.body);
    print(signUpData);

    print('Status code2: ${response.statusCode}');
    print('Body2: ${response.body}');
    int code2 = response.statusCode;

    emit(AuthenticationState(data: signUpData, code: code2));
    ProfileData.getProfileInfo();
  }

  void changeExpertise(value) {
    expertise = value;
  }
}
