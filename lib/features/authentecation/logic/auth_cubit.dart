import 'package:bloc/bloc.dart';
import 'package:crystal_mind/features/authentecation/data/models/login_model.dart';

import 'package:crystal_mind/features/authentecation/data/reposetory/auth_reposetory.dart';
import 'package:flutter/material.dart';


import '../../../core/network/local/shared_pref_helper.dart';
import '../../../core/utils/constants/constants.dart';
import '../screens/login_screen.dart';

part 'auth_state.dart';

//String? userToken;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  final AuthRepo authRepo;

  LoginModel? _loginModel;

  LoginModel? _signUpModel;

  LoginModel? get signUpData => _signUpModel;
  LoginModel? get auth => _loginModel;

  LoginModel? _userModel;
  LoginModel? get userModel => _userModel;

  bool _isObsecure = true;
  bool get obSecure => _isObsecure;

  IconData obSecureIcon = Icons.visibility_off_outlined;

  void logUserIn({required String email, required String password}) async {
    emit(AuthLoadingState());
    final either = await authRepo.logUserIn(email: email, password: password);
    either.fold((failure) {
      emit(AuthUserFailedToAuthenticateState(failMsg: failure.failureMsg));
    }, (auth) {
      _loginModel = auth;
    
      token = auth.data!.token;
      SharedPrefHelper.setData(key: 'token', value: token);

      emit(AuthUserAuthenticatedSuccessfullyState());
    });
  }

  void signUserUp(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    emit(AuthLoadingState());
    final either = await authRepo.signUserUp(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );
    either
        .fold((failure) => emit(SignUpFailedState(failMsg: failure.failureMsg)),
            (signUpData) {
      _signUpModel = signUpData;

      emit(SignUpSuccessfullyState());
    });
  }

  void logUserOut(BuildContext context) {
    SharedPrefHelper.clear('token');
    _loginModel = null;
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => LoginScreen()),
    //     (Route<dynamic> route) => false);
    emit(AuthUserIsNotAuthenticatedState());
  }

  void changeObsecureTexr() {
    _isObsecure = !_isObsecure;
    obSecureIcon = _isObsecure
        ? Icons.visibility_off_outlined
        : Icons.visibility_off_outlined;
    emit(ObsecureChangedState());
  }

// void getUserData() async {
//     emit(AuthLoadingState());
//     final either = await authRepo.getUsersData();
//     either.fold((failure) {
//       emit(AuthUserFailedToAuthenticateState( failMsg: failure.failureMsg));
//     }, (userModel) {
//       _userModel = userModel;
      
//       emit(AuthUserAuthenticatedSuccessfullyState());
//     });
//   }
}
