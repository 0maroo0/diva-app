import 'package:diva/core/helpers/firestore_paths.dart';
import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/core/networking/firestore_services.dart';
import 'package:diva/features/sign_up/data/api/sign_up_api.dart';
import 'package:diva/features/sign_up/data/model/sign_up_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepos {
  final SignUpApi _signUpApi;
  final firestoreServices = FirestoreService.instance;

  SignUpRepos(this._signUpApi);

  // Email Sign-Up
  Future<ApiResult<SignUpResponse>> signUpByEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _signUpApi.signUpWithEmail(email, password);
      SignUpResponse response = SignUpResponse(
        userId: userCredential.user!.uid,
        email: userCredential.user!.email!,
      );
      firestoreServices.setData(path: ApiPaths.user(), data: {
        'userId': response.userId,
        'email': response.email,
      });
      return ApiResult.success(response);
    } on FirebaseAuthException catch (e) {
      ErrorHandler errorHandler = ErrorHandler.handle(e.message!);
      return ApiResult.failure(errorHandler);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle('An error occurred. Please try again later.'),
      );
    }
  }

  // Phone Sign-Up
  Future<ApiResult<void>> signUpByPhone({
    required String phoneNumber,
    required Function(String verificationId, int? resendToken) onCodeSent,
    required Function(PhoneAuthCredential credential) onVerificationCompleted,
    required Function(FirebaseAuthException exception) onVerificationFailed,
  }) async {
    try {
      await _signUpApi.signUpWithPhone(
        phoneNumber: phoneNumber,
        onCodeSent: onCodeSent,
        onVerificationCompleted: onVerificationCompleted,
        onVerificationFailed: onVerificationFailed,
      );
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle('An error occurred during phone sign-up.'),
      );
    }
  }

  // Verify OTP
  Future<ApiResult<void>> verifyOTP({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      await _signUpApi.verifyOTP(verificationId, smsCode);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle('Invalid OTP. Please try again.'),
      );
    }
  }
}
