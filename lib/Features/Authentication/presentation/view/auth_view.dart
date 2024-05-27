import 'package:flutter/material.dart';

import 'widget/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AuthViewBody(),
      ),
    );
  }
}
