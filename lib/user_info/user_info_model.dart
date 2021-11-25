class UserInfoModel {
  final int id;
  final String username;
  final String avatarUrl;
  final int numberOfFollowers;
  final int numberOfFollowing;
  final int numberOfRepos;

  UserInfoModel({
    required this.id,
    required this.username,
    required this.avatarUrl,
    required this.numberOfFollowers,
    required this.numberOfFollowing,
    required this.numberOfRepos,
  });

  UserInfoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['login'],
        avatarUrl = json['avatar_url'],
        numberOfRepos = json['public_repos'],
        numberOfFollowers = json['followers'],
        numberOfFollowing = json['following'];
}
