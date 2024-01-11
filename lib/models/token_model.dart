class TokenModel {
  final String accessToken;
  final String refreshToken;

  TokenModel({required this.accessToken, required this.refreshToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
        accessToken: json['accessToken'], refreshToken: json['refreshToken']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;

    return data;
  }
}
