import 'package:shared_preferences/shared_preferences.dart';

storeOnBordInfo() async {
  String isViewed = 'isOpen';
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('onBord', isViewed);
}
