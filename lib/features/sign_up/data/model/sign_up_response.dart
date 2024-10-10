class SignUpResponse {
  final String userId;
  final String email;

  SignUpResponse({
    required this.userId,
    required this.email,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      userId: json['userId'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
