import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:on_bording_and_auth/Core/utils/app_router.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        if (FirebaseAuth.instance.currentUser == null) {
          GoRouter.of(context).pushReplacement(AppRouter.kbordingView);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.khomePage);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // GoRouter.of(context).pushReplacement(
                //   getIt.get<UserData>().isLogIn
                //       AppRouter.khomePage
                //       : AppRouter.kbordingView,
                // );
                // log(getIt.get<UserData>().isLogIn.toString());
                // GoRouter.of(context).pushReplacement(AppRouter.kbordingView);
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
