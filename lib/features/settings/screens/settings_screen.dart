import 'package:crystal_mind/features/authentecation/logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/colors.dart';
import '../../../core/widgets/default_elevated_button.dart';
import '../../../core/widgets/default_text_field.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  static const routeName = '/settings-screen';
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userModel = context.read<AuthCubit>().userModel;
    return Scaffold(
        body: 
      Padding(
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
                'Profile',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                label: 'Email',
                textController: emailController,
                initialValue: userModel!.data!.email,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter an email' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                label: 'User Name',
                textController: passwordController,
                initialValue: userModel.data!.name,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the password' : null,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                label: 'Phone Number',
                textController: passwordController,
                initialValue: userModel.data!.phone,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the phone number' : null,
              ),
              const SizedBox(
                height: 70,
              ),
              DefaultElevatedButton(
                height: 40,
                width: double.infinity,
                buttonColor: kPrimaryColor,
                text: 'Login',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
