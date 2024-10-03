import 'package:diva/features/login/data/repos/login_repos.dart';
import 'package:diva/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepos) : super(LoginInitial());

  final LoginRepos _loginRepos;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void login() async {
    emit(LoginLoading());

    final response = await _loginRepos.loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
    );

    response.when(
      success: (data) {
        emit(LoginSuccess(data));
      },
      failure: (error) {
        emit(LoginFailure(error.apiErrorModel.message ?? 'Failed to login.'));
      },
    );
  }
}
