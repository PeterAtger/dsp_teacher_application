import 'dart:convert';

import 'package:dsp_teacher_application/Data/Models/profile_data.dart';
import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
import 'package:http/http.dart';

class ProfileData {
  static String email;
  static String fullName;
  static Expertise expertise;
  static String rating;

  const ProfileData();

  static Future<int> getProfileInfo() async {
    final url = Uri.parse('http://34.132.143.59:8000/accounts/me/');
    final headers = {
      "Content-type": "application/json",
      "authorization": "Token ${Tokens.signInToken}"
    };

    final response = await get(url, headers: headers);
    Map profileData = jsonDecode(response.body);
    int code = response.statusCode;

    fullName = profileData['data']['full_name'];
    email = profileData['data']['email'];
    expertise =
        Expertise.values[profileData['data']['teacher']['expertise'] - 1];
    rating = profileData['data']['teacher']['rating'];

    return (code);
  }
}