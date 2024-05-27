import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:on_bording_and_auth/Core/classes/user_data.dart';
import 'package:on_bording_and_auth/Core/utils/app_router.dart';
// import 'package:on_bording_and_auth/Core/utils/srevice_app_setup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;
  @override
  void initState() {
    super.initState();
    // checkIfAlReadyLogin();
  }

  // void checkIfAlReadyLogin() async {
  //   loginData = await SharedPreferences.getInstance();
  //   newUser = (loginData.getBool('login') ?? true);

  //   print(newUser);
  //   if (newUser == false) {
  //     GoRouter.of(context).pushReplacement(AppRouter.khomePage);
  //   }
  // }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 30),
        child: Column(
          children: [
            const Text(
              'Sign up',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: passController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                var name = nameController.text;
                var email = emailController.text;
                var password = passController.text;

                // if (name != '' && email != '' && password != '') {
                //   log('Successful');
                //   getIt.get<UserData>().logIn = true;
                //   getIt.get<SharedPreferences>().setString('userName', name);
                //   getIt.get<SharedPreferences>().setString('userEmail', email);
                //   getIt
                //       .get<SharedPreferences>()
                //       .setString('userPass', password);

                //   GoRouter.of(context).pushReplacement(AppRouter.khomePage);
                // } else {
                //   log('We face a problem');
                // }

                try {
                  final credential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  // ignore: use_build_context_synchronously
                  GoRouter.of(context).pushReplacement(AppRouter.khomePage);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    log('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    log('The account already exists for that email.');
                  }
                } catch (e) {
                  log(e.toString());
                }
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.ksignIn);
              },
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
