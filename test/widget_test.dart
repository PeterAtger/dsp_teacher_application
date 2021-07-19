import 'package:dsp_teacher_application/Logic/profile_data/profile_data_cubit.dart';

main() {
  var pdc = ProfileDataCubit();
  pdc.showProfileData();
  print(pdc.state);
}
