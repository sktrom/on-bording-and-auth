import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:on_bording_and_auth/Core/classes/item_of_on_bording.dart';
// import 'package:on_bording_and_auth/Core/classes/user_data.dart';
// import 'package:on_bording_and_auth/Core/classes/user_data.dart';
import 'package:on_bording_and_auth/Core/utils/app_router.dart';
// import 'package:on_bording_and_auth/Core/utils/srevice_app_setup.dart';
// import 'package:on_bording_and_auth/Core/utils/srevice_app_setup.dart';
import 'package:on_bording_and_auth/Features/On_Bording/presentation/manager/on_pagechange_cubit.dart';

class BorderViewBody extends StatefulWidget {
  const BorderViewBody({super.key});

  @override
  State<BorderViewBody> createState() => _BorderViewBodyState();
}

class _BorderViewBodyState extends State<BorderViewBody> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnPagechangeCubit, OnPagechangeState>(
      builder: (context, state) {
        return PageView.builder(
          controller: controller,
          itemCount: ItemOfBording.items.length,
          onPageChanged: (value) {
            BlocProvider.of<OnPagechangeCubit>(context)
                .onPageChangeIndex(value);
          },
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: ItemOfBording.items[index]['image'],
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      ItemOfBording.items.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 6),
                        height: 10,
                        width: state.indexPage == index ? 30 : 10,
                        decoration: BoxDecoration(
                          color: state.indexPage == index
                              ? Colors.red
                              : Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text('${ItemOfBording.items[index]['title']}'),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      if (state.indexPage == ItemOfBording.items.length - 1) {
                        // getIt.get<UserData>().logIn = true;
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kauthView);
                      } else {
                        controller.nextPage(
                            duration: const Duration(microseconds: 100),
                            curve: Curves.bounceIn);
                      }
                    },
                    child: Text(
                      state.indexPage == ItemOfBording.items.length - 1
                          ? 'Get Stated'
                          : 'Next',
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
