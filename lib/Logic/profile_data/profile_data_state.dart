part of 'profile_data_cubit.dart';

@immutable
class ProfileDataState {
  final int statusCode;
  final String fullName;
  final String email;
  final String rating;
  final Expertise expertise;

  ProfileDataState(
      {this.statusCode,
      this.fullName,
      this.email,
      this.rating,
      this.expertise});
}
// hkvgk
