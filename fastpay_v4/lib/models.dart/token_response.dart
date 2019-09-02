class AuthTokenResponse {

  final String token;
   String encryptionKey;

  AuthTokenResponse({ this.token, this.encryptionKey});

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) {
    return AuthTokenResponse(
      token: json['token'] as String,
      encryptionKey: json['encryptionKey'] as String,
    );
}
}