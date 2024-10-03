import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/features/sign_up/data/model/sign_up_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepos {
  final FirebaseAuth _auth;

  SignUpRepos(this._auth);

  // Email Sign-Up
  Future<ApiResult<SignUpResponse>> signUpByEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      SignUpResponse response = SignUpResponse(
        userId: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
      return ApiResult.success(response);
    } on FirebaseAuthException catch (e) {
      ErrorHandler errorHandler;
      if (e.code == 'weak-password') {
        errorHandler =
            ErrorHandler.handle('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        errorHandler =
            ErrorHandler.handle('The account already exists for that email.');
      } else {
        errorHandler = ErrorHandler.handle('An error occurred.');
      }
      return ApiResult.failure(errorHandler);
    } catch (e) {
      ErrorHandler errorHandler =
          ErrorHandler.handle('An error occurred. Please try again later.');
      return ApiResult.failure(errorHandler);
    }
  }

  // Phone Number Sign-Up
  Future<ApiResult<void>> signUpByPhone({
    required String phoneNumber,
    required Function(String verificationId, int? resendToken) onCodeSent,
    required Function(PhoneAuthCredential credential) onVerificationCompleted,
    required Function(FirebaseAuthException exception) onVerificationFailed,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+972$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto sign-in when verification is completed
          await _auth.signInWithCredential(credential);
          onVerificationCompleted(credential);
        },
        verificationFailed: (FirebaseAuthException exception) {
          onVerificationFailed(exception);
        },
        codeSent: (String verificationId, int? resendToken) {
          onCodeSent(verificationId, resendToken);
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return const ApiResult.success(null);
    } catch (e) {
      ErrorHandler errorHandler =
          ErrorHandler.handle('An error occurred during phone sign-up.');
      return ApiResult.failure(errorHandler);
    }
  }

  // Verify OTP (Phone Number Sign-Up)
  Future<ApiResult<void>> verifyOTP({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      return const ApiResult.success(null);
    } catch (e) {
      ErrorHandler errorHandler =
          ErrorHandler.handle('Invalid OTP. Please try again.');
      return ApiResult.failure(errorHandler);
    }
  }
}
