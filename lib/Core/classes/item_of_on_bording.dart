import 'package:lottie/lottie.dart';

abstract class ItemOfBording {
  static List<Map<String, dynamic>> items = [
    {
      'image': Lottie.asset('assets/image/a1.json'),
      'title': 'مرحبا',
    },
    {
      'image': Lottie.asset('assets/image/a2.json'),
      'title': 'مرحبا بك',
    },
    {
      'image': Lottie.asset('assets/image/a3.json'),
      'title': 'مرحبا بك في',
    },
    {
      'image': Lottie.asset('assets/image/a1.json'),
      'title': 'مرحبا بك في تطبيقنا',
    }
  ];
}
