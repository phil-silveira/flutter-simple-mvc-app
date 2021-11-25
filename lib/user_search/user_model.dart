class UserModel {
  final int id;
  final String username;
  final String avatarUrl;
  final String url;

  UserModel({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.url,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        username: json['login'],
        avatarUrl: json['avatar_url'],
        url: json['url'],
      );
}

extension StringExtension on String {
  String get capitalized => this[0].toUpperCase() + substring(1);
}
