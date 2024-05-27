import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_bording_and_auth/Features/On_Bording/presentation/manager/on_pagechange_cubit.dart';

import 'widget/border_view_body.dart';

class BordingView extends StatelessWidget {
  const BordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => OnPagechangeCubit(),
        child: const Scaffold(
          body: BorderViewBody(),
        ),
      ),
    );
  }
}
