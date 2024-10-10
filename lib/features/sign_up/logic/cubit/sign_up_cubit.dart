import 'package:diva/core/helpers/app_regex.dart';
import 'package:diva/features/sign_up/data/repos/sign_up_repos.dart';
import 'package:diva/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepos _signUpRepos;
  SignUpCubit(this._signUpRepos) : super(SignUpInitial());

  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? _verificationId;

  // Method to decide whether to sign up using email or phone
  void signUp() async {
    emit(SignUpLoadingEmail());
    if (AppRegex.isEmailValid(emailOrPhoneController.text)) {
      _signUpWithEmail();
    } else {
      _signUpWithPhone();
    }
  }

  // Email sign-up logic
  Future<void> _signUpWithEmail() async {
    final response = await _signUpRepos.signUpByEmail(
      email: emailOrPhoneController.text,
      password: passwordController.text,
    );

    response.when(
      success: (data) {
        emit(SignUpSuccessEmail(data));
      },
      failure: (error) {
        emit(SignUpFailureEmail(
            error.apiErrorModel.message ?? 'Failed to sign up using email.'));
      },
    );
  }

  // Phone sign-up logic
  Future<void> _signUpWithPhone() async {
    final response = await _signUpRepos.signUpByPhone(
      phoneNumber: emailOrPhoneController.text,
      onCodeSent: _onCodeSent,
      onVerificationCompleted: _onVerificationCompleted,
      onVerificationFailed: _onVerificationFailed,
    );

    response.when(
      success: (_) {
        emit(SignUpSuccessPhone());
      },
      failure: (error) {
        emit(SignUpFailurePhone(
            error.apiErrorModel.message ?? 'Failed to sign up using phone.'));
      },
    );
  }

  // Handle when verification is completed successfully
  void _onVerificationCompleted(PhoneAuthCredential credential) async {
    await _signInWithCredential(credential);
    emit(SignUpSuccessPhone());
  }

  // Handle failure in phone verification
  void _onVerificationFailed(FirebaseAuthException error) {
    emit(SignUpFailurePhone(error.message ?? 'Phone verification failed.'));
  }

  // When OTP is sent, store the verificationId
  void _onCodeSent(String verificationId, int? resendToken) {
    _verificationId = verificationId;
    emit(SignUpCodeSent(verificationId, resendToken));
  }

  // Method to submit the OTP for verification
  Future<void> submitOTP(String otpCode) async {
    if (_verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otpCode,
      );
      await _signInWithCredential(credential);
    } else {
      emit(SignUpFailurePhone('Verification ID is missing.'));
    }
  }

  // Sign in using the provided credential
  Future<void> _signInWithCredential(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOTPVerified());
    } catch (error) {
      emit(SignUpFailurePhone(error.toString()));
    }
  }

  // Log out the user
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // Get the current logged-in user, if available
  User? getLoggedInUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
