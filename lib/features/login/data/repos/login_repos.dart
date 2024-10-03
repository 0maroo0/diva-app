import 'package:firebase_auth/firebase_auth.dart';
import 'package:diva/core/networking/api_error_handler.dart';
import 'package:diva/core/networking/api_result.dart';

class LoginRepos {
  final FirebaseAuth _auth;

  LoginRepos(this._auth);

  // Login with Email and Password
  Future<ApiResult<User>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ApiResult.success(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      ErrorHandler errorHandler;
      if (e.code == 'user-not-found') {
        errorHandler = ErrorHandler.handle('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        errorHandler = ErrorHandler.handle('Wrong password provided.');
      } else {
        errorHandler = ErrorHandler.handle('An error occurred during login.');
      }
      return ApiResult.failure(errorHandler);
    } catch (e) {
      ErrorHandler errorHandler = ErrorHandler.handle('An unexpected error occurred.');
      return ApiResult.failure(errorHandler);
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
