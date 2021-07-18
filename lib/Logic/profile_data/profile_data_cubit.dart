import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/Models/profile_data.dart';
import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit() : super(ProfileDataState());
  Future<void> signInPostRequest(String email, String password) async {
    final url = Uri.parse('http://34.132.143.59:8000/sentences/accounts/me/');
    final headers = {
      "Content-type": "application/json",
      "authorization": "Token $SIGNINTOKEN"
    };

    final response = await get(url, headers: headers);
    Map profileData = jsonDecode(response.body);
    print(profileData);

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    int code1 = response.statusCode;

    emit(ProfileDataState());
  }
}
