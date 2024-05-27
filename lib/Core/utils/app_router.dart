import 'package:go_router/go_router.dart';
import 'package:on_bording_and_auth/Features/Authentication/presentation/view/auth_view.dart';
import 'package:on_bording_and_auth/home_page.dart';
import 'package:on_bording_and_auth/sing_in_page.dart';
import 'package:on_bording_and_auth/splach_page.dart';
import '../../Features/On_Bording/presentation/view/bording_view.dart';

abstract class AppRouter {
  static const ksplashpage = '/';

  static const kauthView = '/authView';
  static const khomePage = '/homePage';
  static const kbordingView = '/bordingView';
  static const ksignIn = '/signIn';

  static final route = GoRouter(
    routes: [
      GoRoute(
        path: ksplashpage,
        builder: (context, state) => const SplachView(),
      ),
      GoRoute(
        path: kbordingView,
        builder: (context, state) => const BordingView(),
      ),
      GoRoute(
        path: kauthView,
        builder: (context, state) => const AuthView(),
      ),
      GoRoute(
        path: khomePage,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: ksignIn,
        builder: (context, state) => const SignIn(),
      ),
    ],
  );
}
