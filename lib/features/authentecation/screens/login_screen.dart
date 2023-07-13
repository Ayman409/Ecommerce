import 'package:crystal_mind/core/network/local/shared_pref_helper.dart';
import 'package:crystal_mind/core/utils/popups.dart';
import 'package:crystal_mind/features/authentecation/screens/signup_screen.dart';
import 'package:crystal_mind/features/layout/app_layout.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/colors.dart';
import '../../../core/widgets/default_elevated_button.dart';
import '../../../core/widgets/default_text_field.dart';

import '../logic/auth_cubit.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const routeName = '/login-screen';
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Login',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                label: 'Email',
                textController: emailController,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter an email' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                label: 'Pssword',
                textController: passwordController,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the password' : null,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Don\'t have an acount?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(color: kContentColorBlue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthUserFailedToAuthenticateState) {
                    showToast(msg: state.failMsg);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                  return DefaultElevatedButton(
                    height: 40,
                    width: double.infinity,
                    buttonColor: kPrimaryColor,
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).logUserIn(
                            email: emailController.text,
                            password: passwordController.text);
                        SharedPrefHelper.sharedPreferences!
                            .setBool('isLoggedIn', true);

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AppLayout(),
                            ),
                            (route) => false);
                        // print('**********************');
                        // print(userToken);
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
