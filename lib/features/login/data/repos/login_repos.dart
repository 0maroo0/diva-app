import 'package:diva/features/login/data/apis/auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:diva/core/networking/api_result.dart';
import 'package:diva/core/networking/api_error_handler.dart';

class LoginRepository {
  final LoginAPI _loginAPI;

  LoginRepository(this._loginAPI);

  Future<ApiResult<User>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _loginAPI.loginWithEmailAndPassword(
        email,
        password,
      );
      return ApiResult.success(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      String errorMessage = handleAuthError(e);
      return ApiResult.failure(ErrorHandler.handle(errorMessage));
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle('An unexpected error occurred.'),
      );
    }
  }

  Future<void> logout() async {
    await _loginAPI.signOut();
  }
}
