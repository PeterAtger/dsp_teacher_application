import 'package:bloc/bloc.dart';
import 'package:dsp_teacher_application/Data/Models/profile_data.dart';
import 'package:dsp_teacher_application/Data/repositries/profile_data/profile_data.dart';
import 'package:dsp_teacher_application/Data/repositries/sign_in_token.dart';
import 'package:meta/meta.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit()
      : super(ProfileDataState(
            fullName: 'N/A',
            email: 'N/A',
            rating: ' ',
            statusCode: null,
            expertise: Expertise.Fresh));

  void showProfileData() async {
    print(Tokens.signInToken);
    if (ProfileData.fullName == null) {
      await ProfileData.getProfileInfo();
    }
    emit(ProfileDataState(
        fullName: ProfileData.fullName,
        email: ProfileData.email,
        expertise: ProfileData.expertise,
        rating: ProfileData.rating));
  }
}
