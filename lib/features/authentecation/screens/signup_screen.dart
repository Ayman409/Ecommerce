import 'package:crystal_mind/features/authentecation/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/colors.dart';
import '../../../core/utils/popups.dart';
import '../../../core/widgets/default_elevated_button.dart';
import '../../../core/widgets/default_text_field.dart';
import '../logic/auth_cubit.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static const routeName = '/signup-screen';
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                label: 'Name',
                textController: nameController,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
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
                    value!.isEmpty ? 'Please enter an password' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                label: 'Phone',
                textController: phoneController,
                textInputType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter phone number' : null,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text('Already have an acount?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: kContentColorBlue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is SignUpFailedState) {
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
                    buttonColor: kContentColorBlue,
                    text: 'Sign up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().signUserUp(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text);
                        if (state is SignUpSuccessfullyState) {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        }
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
