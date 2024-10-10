import 'package:diva/features/sign_up/data/model/sign_up_response.dart';

class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoadingEmail extends SignUpState {}

class SignUpSuccessEmail extends SignUpState {
  final SignUpResponse response;

  SignUpSuccessEmail(this.response);
}

class SignUpFailureEmail extends SignUpState {
  final String error;

  SignUpFailureEmail(this.error);
}

class SignUpLoadingPhone extends SignUpState {}

class SignUpSuccessPhone extends SignUpState {}

class SignUpFailurePhone extends SignUpState {
  final String error;

  SignUpFailurePhone(this.error);
}

class ErrorOccurred extends SignUpState {
  final String errorMsg;

  ErrorOccurred({required this.errorMsg});
}

class PhoneNumberSubmited extends SignUpState {
  PhoneNumberSubmited();
}

class PhoneOTPVerified extends SignUpState {
  PhoneOTPVerified();
}

class SignUpCodeSent extends SignUpState {
  final String verificationId;
  final int? resendToken;

  SignUpCodeSent(this.verificationId, this.resendToken);
}
