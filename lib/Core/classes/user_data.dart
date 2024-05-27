import 'package:on_bording_and_auth/Core/utils/srevice_app_setup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  bool get isLogIn =>
      getIt.get<SharedPreferences>().getBool('logInKey') ?? false;
  set logIn(bool value) =>
      getIt.get<SharedPreferences>().setBool('logInKey', value);
}
